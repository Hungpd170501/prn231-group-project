﻿using BusinessObject;
using DataTransfer.Request;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.AspNetCore.OData.Routing.Controllers;
using Repositories.Impl;
using Repositories;
using AutoMapper;

namespace ITManagementSystemWebAPI.Controllers
{
    public class TakeLeaveController : ODataController
    {
        private readonly ITakeLeaveRepository takeLeaveRepository;
        private readonly IMapper _mapper;

        public TakeLeaveController(ITakeLeaveRepository takeLeaveRepository, IMapper mapper)
        {
            this.takeLeaveRepository = takeLeaveRepository;
            _mapper = mapper;
        }

        [EnableQuery]
        public IActionResult Get() => Ok(takeLeaveRepository.GetTakeLeaves());

        [EnableQuery]
        public ActionResult<Position> Get([FromRoute] int key)
        {
            var item = takeLeaveRepository.GetTakeLeaveById(key);

            if (item == null) return NotFound();

            return Ok(item);
        }

        public ActionResult Post([FromBody] TakeLeaveReq postTakeLeave)
        {
            var tempContract = takeLeaveRepository.GetActiveContractByEmployeeIdEqual(postTakeLeave.EmployeeId);
            if (tempContract==null)
            {
                return BadRequest("Employee require at least 1 active contract to create leave!");
            }
            if (!postTakeLeave.StartDate.Year.Equals(postTakeLeave.EndDate.Year))
            {
                return BadRequest("Please provide the start day and end date within the same calendar year. This will help us accurately calculate the duration leave of your request. Thank you!");
            }
            if (postTakeLeave.StartDate > postTakeLeave.EndDate)
            {
                DateTime temp = postTakeLeave.StartDate;
                postTakeLeave.StartDate = postTakeLeave.EndDate;
                postTakeLeave.EndDate = temp;
            }
            var tempTakeLeave = takeLeaveRepository.GetTakeLeaveByDateBetweenAndEmployeeIdEqual(postTakeLeave.StartDate, postTakeLeave.EndDate, postTakeLeave.EmployeeId);
            if (tempTakeLeave != null)
            {
                return BadRequest("Leave already exists!");
            }
            int leaveDays = takeLeaveRepository.CalculateLeaveDays(postTakeLeave.StartDate, postTakeLeave.EndDate);
            if (postTakeLeave.Type.Equals(TakeLeaveType.ANNUAL_LEAVE))
            {
                int leaveBalance = tempContract.DateOffPerYear - takeLeaveRepository.CalculateLeaveDaysByEmployeeIdEqualAndYearEqual(postTakeLeave.EmployeeId, postTakeLeave.StartDate.Year);
                if (leaveBalance < leaveDays)
                {
                    return BadRequest($"Don't have enough ANNUAL LEAVE to create Leave!(need: {leaveDays}, available: {leaveBalance})");
                }
            }
            var _mappedTakeLeave = _mapper.Map<TakeLeave>(postTakeLeave);
            _mappedTakeLeave.Status = TakeLeaveStatus.WAITING;
            _mappedTakeLeave.LeaveDays = leaveDays;
            takeLeaveRepository.SaveTakeLeave(_mappedTakeLeave);

            return Created(_mappedTakeLeave);
        }

        public IActionResult Put([FromRoute] int key, [FromBody] TakeLeaveReq postTakeLeave)
        {
            var tempContract = takeLeaveRepository.GetActiveContractByEmployeeIdEqual(postTakeLeave.EmployeeId);
            if (tempContract == null)
            {
                return BadRequest("Employee require at least 1 active contract to edit leave!");
            }
            var takeLeave = takeLeaveRepository.GetTakeLeaveById(key);

            if (takeLeave == null)
            {
                return NotFound();
            }
            if(postTakeLeave.Status.Equals(TakeLeaveStatus.APPROVED)) 
            {
                var tempTakeLeave = takeLeaveRepository.GetTakeLeaveByDateBetweenAndEmployeeIdEqual(postTakeLeave.StartDate, postTakeLeave.EndDate, postTakeLeave.EmployeeId);
                if (tempTakeLeave != null)
                {
                    return BadRequest("Another Leave request has already been approved for the same time period!");
                }
            }
            int leaveDays = takeLeaveRepository.CalculateLeaveDays(postTakeLeave.StartDate, postTakeLeave.EndDate);
            if (postTakeLeave.Type.Equals(TakeLeaveType.ANNUAL_LEAVE))
            {
                int leaveBalance = tempContract.DateOffPerYear - takeLeaveRepository.CalculateLeaveDaysByEmployeeIdEqualAndYearEqual(postTakeLeave.EmployeeId, postTakeLeave.StartDate.Year);
                if (leaveBalance < leaveDays)
                {
                    return BadRequest($"Don't have enough ANNUAL LEAVE to create Leave!(need: {leaveDays}, available: {leaveBalance})");
                }
            }
            var _mappedTakeLeave = _mapper.Map<TakeLeave>(postTakeLeave);
            _mappedTakeLeave.Id = key;
            _mappedTakeLeave.LeaveDays = leaveDays;
            takeLeaveRepository.UpdateTakeLeave(_mappedTakeLeave);
            return Updated(_mappedTakeLeave);
        }

        public ActionResult Delete([FromRoute] int key)
        {
            var takeLeave = takeLeaveRepository.GetTakeLeaveById(key);
            if (takeLeave == null)
            {
                return NotFound();
            }
            takeLeaveRepository.DeleteTakeLeave(takeLeave);
            return NoContent();
        }
    }
}