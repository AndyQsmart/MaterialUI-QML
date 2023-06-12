pragma Singleton

import QtQuick 2.0

Item {
    id: global_route
    signal switchToCallback(string url)
    signal navigateToCallback(string url)
    signal redirectToCallback(string url)
    signal navigateBackCallback(int count)

    property var routeStack: [{ url: "/" }]

    function getStack() {
        return routeStack
    }

    function setStack(value) {
        routeStack = value
    }

    function getUrlArg() {
        let current_route = routeStack[routeStack.length-1]
        return current_route.arg
    }

    function switchTo(url, arg=null) {
        let current_route = routeStack[routeStack.length-1]
        if (current_route.url === url) {
            return
        }

        console.log('(Route.qml)Route.switchTo url:', url, 'arg:', JSON.stringify(arg))
        routeStack.push({
            url,
            arg
        })
        switchToCallback(url)
    }

    function navigateTo(url, arg=null) {
        let current_route = routeStack[routeStack.length-1]
        if (current_route.url === url) {
            return
        }

        console.log('(Route.qml)Route.navigateTo url:', url, 'arg:', JSON.stringify(arg))
        routeStack.push({
            url,
            arg
        })
        navigateToCallback(url)
    }

    function redirectTo(url, arg=null) {
        let current_route = routeStack[routeStack.length-1]
        if (current_route.url === url) {
            return
        }

        console.log('(Route.qml)Route.redirectTo url:', url, 'arg:', JSON.stringify(arg))
        routeStack[routeStack.length-1] = {
            url,
            arg
        }
        redirectToCallback(url)
    }

    function navigateBack(fail_url="/", count=1) {
        if (routeStack.length > 1) {
            routeStack.splice(routeStack.length-count, count)
            navigateBackCallback(count)
        }
        else {
            routeStack = [{
                url: fail_url,
                arg: null,
            }]
            redirectToCallback(fail_url)
        }
    }
}
