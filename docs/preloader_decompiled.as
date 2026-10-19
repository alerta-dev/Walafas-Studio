function Center(MC) {
  MC._x = Stage.width / 2 - MC._width / 2;
  MC._y = Stage.height / 2 - MC._height / 2;
}
function toggleFullScreen() {
  if ((Stage.displayState == "normal")) {
    Stage.displayState = "fullScreen";
  } else {
    Stage.displayState = "normal";
  }
}
function goWalfas() {
  getURL("http://www.walfas.org/","_blank");
}
function addCMItem(S, F) {
  $r1 = new ContextMenuItem(S, F);
  myContextMenu.customItems.push($r1);
}
Stage.scaleMode = "noScale";
Stage.align = "TL";
_root.attachMovie("Preloader", "preloader", 10);
function () {
  if ((_root.getBytesLoaded() == _root.getBytesTotal())) {
    gotoFrame(2);
  } else {
    $r2 = Math.floor(_root.getBytesLoaded() / _root.getBytesTotal() * 100);
    preloader.percent.text = String($r2) + "%";
    preloader.loaderBar._xscale = $r2;
  }
}
<?>[preloader] = "onEnterFrame";
var myContextMenu = new ContextMenu();
myContextMenu.builtInItems.play = false;
myContextMenu.builtInItems.rewind = false;
myContextMenu.builtInItems.forward_back = false;
myContextMenu.builtInItems.loop = false;
myContextMenu.builtInItems.print = false;
addCMItem("Full Screen Mode!", toggleFullScreen);
addCMItem("http://www.walfas.org", goWalfas);
_root.menu = myContextMenu;
stop();