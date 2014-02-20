proc fakeRequest {{headers {}}} {
    set request [::agate::request::Request #auto]
    $request setHeaderData $headers
    $request setUri [$request getHeader REQUEST_URI]
    return [namespace which $request]
}

