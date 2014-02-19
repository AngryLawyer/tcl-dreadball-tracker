namespace eval ::dreadball::accounts {
    namespace export accounts
}

# TODO: Provde a mount or equivalent for compound routes?
proc ::dreadball::accounts::routes {app} {

    $app get "^/accounts/login/$" {{} {
        return "Login page"
    }}

    $app post "^/accounts/login/$" {{} {
        return "Login attempt"
    }}

    $app get "^/accounts/register/$" {{} {
        return "Register page"
    }}

    $app post "^/accounts/register/$" {{} {
        return "Register attempt"
    }}

    $app get "^/accounts/register/success/$" {{} {
        return "Register success"
    }}
}
