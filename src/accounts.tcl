package require SimpleTemplater

namespace eval ::dreadball::accounts {
    namespace export accounts
}

# TODO: Provde a mount or equivalent for compound routes?
proc ::dreadball::accounts::routes {app} {

    $app get "^/accounts/login/$" {{} {
        #FIXME: This should be able to pull things from a sensible base path
        return [::SimpleTemplater::render ../src/templates/index.tpl {}]
    }}

    $app post "^/accounts/login/$" {{} {
        return "Login attempt"
    }}

    $app get "^/accounts/register/$" {{} {
        return [::SimpleTemplater::render ../src/templates/index.tpl {}]
    }}

    $app post "^/accounts/register/$" {{} {
        return "Register attempt"
    }}

    $app get "^/accounts/register/success/$" {{} {
        return [::SimpleTemplater::render ../src/templates/index.tpl {}]
    }}
}
