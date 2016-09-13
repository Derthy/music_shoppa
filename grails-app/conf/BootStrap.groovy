import org.example.SecRole;
import org.example.SecUser;
import org.example.SecUserSecRole;

import com.dmcs.dszubert.Products

class BootStrap {

    def init = { servletContext ->
		if(SecUser.count() == 0){
			new SecUser( username: 'admin', password: 'admin').save()
			new SecUser( username: 'user', password: 'user').save()
		}
		if(SecRole.count() == 0) {
			new SecRole(authority: "ROLE_ADMIN").save()	
			new SecRole(authority: "ROLE_USER").save()
		}
		if(SecUserSecRole.count() == 0) {
			new SecUserSecRole(SecUser.first(),SecRole.first()).save()
			new SecUserSecRole(SecUser.findByUsername('user'),SecRole.findByAuthority('ROLE_USER'))
		}
    }
    def destroy = {
    }
}
