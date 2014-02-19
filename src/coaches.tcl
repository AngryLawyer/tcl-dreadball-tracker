namespace eval ::dreadball::coaches {
    namespace export routes 
}

# TODO: Provde a mount or equivalent for compound routes?
proc ::dreadball::coaches::routes {app} {

    $app get "^/coaches/$" {{} {
        return "Coach the sports"
    }}

    $app post "^/coaches/$" {{} {
        return "Create the coach"
    }}

    $app get {^/coaches/([0-9a-f]+)/} {{} {
        return "Coach"
    }}

    $app post {^/coaches/([0-9a-f]+)/delete/} {{} {
        return "Delete the coach"
    }}

    $app get {^/coaches/([0-9a-f]+)/teams/} {{} {
        return "Coach the teams"
    }}

}
