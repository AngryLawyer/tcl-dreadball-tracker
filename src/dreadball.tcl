package require agate

namespace eval ::dreadball::dreadball {
    namespace export dreadball 
}

::agate::relativeSource accounts.tcl

proc ::dreadball::dreadball::new {} {
    set app [namespace which [::agate::Application #auto -baseUrl /sports-test]]

    ::dreadball::accounts::routes $app

    $app get "^/$" {{} {
        return "Sport the sports"
    }}

    return $app
}
