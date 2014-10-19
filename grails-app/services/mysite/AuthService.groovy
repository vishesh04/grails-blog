package mysite

import grails.transaction.Transactional

@Transactional
class AuthService {

    def authorizeScaffoldings(def password) {
        if (password != 'secret786') {
            return false
        } else {
            return true
        }
    }
}
