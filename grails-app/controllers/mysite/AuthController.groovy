package mysite

import grails.util.Holders

class AuthController {

    def login(String password) {
        if (password == Holders.config.auth.masterPassword) {
            session.loggedIn = true
            session.setMaxInactiveInterval(2*7*24*3600)  //2 weeks
            render "Logged In succesfully"
        } else{
            render "Please try again"
        }
    }

    def logout() {
        session.invalidate()
        render "logged out successfully"
    }
}
