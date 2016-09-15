import org.example.SecRole;
import org.example.SecUser;
import org.example.SecUserSecRole;

import com.dmcs.dszubert.Products

class BootStrap {

    def init = { servletContext ->
        def user = SecUser.findByUsername('admin')
        def role = SecRole.findByAuthority('ROLE_ADMIN')
        if (user == null) {
            user = new SecUser(username: 'admin', password: 'admin').save()
        }
        if(role == null){
            role = new SecRole(authority: "ROLE_ADMIN").save()
        }
        if(user != null && role != null){
            new SecUserSecRole(user, role).save()
        }
        user = SecUser.findByUsername('user')
        role = SecRole.findByAuthority('ROLE_USER')
        if (user == null) {
            user = new SecUser(username: 'user', password: 'user').save()
        }
        if(role == null){
            role = new SecRole(authority: "ROLE_USER").save()
        }
        if(user != null && role != null){
            new SecUserSecRole(user, role).save()
        }
    }
    def destroy = {
	}
}