using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace se_DesignFirst_1.Models
{
    public class UserRoleEntity : IdentityRole
    {
        public UserRoleEntity() : base()
        {

        }

        public UserRoleEntity(string roleName) : base(roleName)
        {
        }
    }
}