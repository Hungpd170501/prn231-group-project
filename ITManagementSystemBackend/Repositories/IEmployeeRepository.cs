﻿using BusinessObject;
using BusinessObject.DTO;
using DataTransfer.Request;
using DataTransfer.Response;

namespace Repositories
{
    public interface IEmployeeRepository
    {
        public string CreateUser(EmployeeReq employee);
        public List<EmployeeResponse> GetAll();
        public bool UpdateUser(int id, EmployeeUpdateDTO employee);
        public bool DeleteUser(int id);
        public Employee GetEmployeeById(int id);
        public string DeactivateEmployee(int id);
        public void ActiveEmployee(int id);
    }
}
