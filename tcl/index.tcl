package require agate
#package require SimpleTemplater
#package require sqlite3


namespace eval ::request {

    ::agate::relativeSource coaches.tcl
    set app [namespace which [::agate::Application #auto -baseUrl /sports-test]]

    ::dreadball::coaches::routes $app

    $app get "^/$" {{} {
        return "Sport the sports"
    }}

    $app run
    itcl::delete object $app
}
