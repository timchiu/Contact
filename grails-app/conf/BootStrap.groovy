import org.apache.shiro.crypto.hash.Sha256Hash

import com.fycd.contact.Address
import com.fycd.contact.ContactGroup
import com.fycd.contact.Role
import com.fycd.contact.TaoCenter
import com.fycd.contact.TaoMember
import com.fycd.contact.TaoRegion
import com.fycd.contact.Temple
import com.fycd.contact.User


class BootStrap {

	def roleService
	
    def init = { servletContext ->

			def adminRole = Role.findByName("admin") ?: new Role(name: "admin", permissions: ["*:*:*"]).save(failOnError: true)
			def memberRole = Role.findByName("member") ?: new Role(name: "member", permissions: ["taomember:*:*", "contactrecord:saveFromForm:*"]).save(failOnError: true)
			def groupLeaderRole = Role.findByName("groupLeader") ?: new Role(name: "groupLeader", permissions: ["taomember:*:*", "contactgroup:*:*", "contactrecord:saveFromForm:*"]).save(failOnError: true)
			def regionLeaderRole = Role.findByName("regionLeader") ?: new Role(name: "regionLeader", permissions: ["taomember:*:*", "contactgroup:*:*", "taoregion:*:*", "contactrecord:saveFromForm:*"]).save(failOnError: true)
			def seniorLecturerRole = Role.findByName("seniorLecturer") ?: new Role(name: "seniorLecturer", permissions: ["taomember:*:*", "contactgroup:*:*", "taoregion:*:*", "contactrecord:saveFromForm:*"]).save(failOnError: true)
			def masterRole = Role.findByName("master") ?: new Role(name: "master", permissions: ["taomember:*:*", "contactgroup:*:*", "taoregion:*:*", "contactrecord:saveFromForm:*"]).save(failOnError: true)
			def academicLeaderRole = Role.findByName("academicLeader") ?: new Role(name: "academicLeader", permissions: ["taomember:*:*", "contactrecord:saveFromForm:*"]).save(failOnError: true)
			

			// calculate age
			def users = TaoMember.findAllByBirthDateIsNotNullAndAgeIsNull();
			Calendar now = Calendar.getInstance()
			users.each {
				it.age = (now.getTime().getTime() - it.birthDate.getTime()) / (1000 * 3600 * 24 * 365.25);
				it.save(failOnError: true)
			}

		
    }
    def destroy = {
    }
}
