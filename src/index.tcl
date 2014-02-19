package require agate
package require SimpleTemplater
#package require sqlite3


namespace eval ::request {

    ::agate::relativeSource dreadball.tcl
    set app [::dreadball::dreadball::new]
    itcl::delete object $app
}
