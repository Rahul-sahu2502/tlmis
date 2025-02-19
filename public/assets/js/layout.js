!(function () {
    "use strict";
    var t, a, e;
    sessionstorage.getitem("defaultattribute") &&
        ((t = document.documentelement.attributes),
        (a = {}),
        object.entries(t).foreach(function (t) {
            var e;
            t[1] &&
                t[1].nodename &&
                "undefined" != t[1].nodename &&
                ((e = t[1].nodename), (a[e] = t[1].nodevalue));
        }),
        sessionstorage.getitem("defaultattribute") !== json.stringify(a)
            ? (sessionstorage.clear(), window.location.reload())
            : (((e = {})["data-layout"] =
                  sessionstorage.getitem("data-layout")),
              (e["data-sidebar-size"] =
                  sessionstorage.getitem("data-sidebar-size")),
              (e["data-bs-theme"] = sessionstorage.getitem("data-bs-theme")),
              (e["data-layout-width"] =
                  sessionstorage.getitem("data-layout-width")),
              (e["data-sidebar"] = sessionstorage.getitem("data-sidebar")),
              (e["data-sidebar-image"] =
                  sessionstorage.getitem("data-sidebar-image")),
              (e["data-layout-direction"] = sessionstorage.getitem(
                  "data-layout-direction"
              )),
              (e["data-layout-position"] = sessionstorage.getitem(
                  "data-layout-position"
              )),
              (e["data-layout-style"] =
                  sessionstorage.getitem("data-layout-style")),
              (e["data-topbar"] = sessionstorage.getitem("data-topbar")),
              (e["data-preloader"] = sessionstorage.getitem("data-preloader")),
              (e["data-body-image"] =
                  sessionstorage.getitem("data-body-image")),
              object.keys(e).foreach(function (t) {
                  e[t] && document.documentelement.setattribute(t, e[t]);
              })));
})();
