package mysite

import grails.transaction.Transactional
import grails.util.Holders

@Transactional
class AuthService {

    def authorizeScaffoldings(def password) {
        if (password != Holders.config.auth.masterPassword) {
            return false
        } else {
            return true
        }
    }
}
