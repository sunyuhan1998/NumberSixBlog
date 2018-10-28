Aui.ready(function() {
    var oWrap = Aui("#demo"),
    oTabs = oWrap.find("li"),
    oTabsLen = oTabs.length,
    oMove = Aui("#tabsMove"),
    nWidth = oMove.children().eq(0).width(),
    iTimer = null,
    IDX = 0;

    oTabs.bind("click",
    function() {
        var _this = Aui(this);

        IDX = _this.index();

        _this.addClass("curr").siblings().removeClass("curr");

        oMove.stop().fx({
            left: -nWidth * IDX
        },
        200);
    });
});