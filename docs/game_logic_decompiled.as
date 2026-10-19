function newKey(n, c, chk) {
  GameData.Keys.Buttons[n] = new Object();
  GameData.Keys.Buttons[n].Code = c;
  GameData.Keys.Buttons[n].Pressed = false;
  if (chk) {
    GameData.Keys.Buttons[n].Check = chk;
  }
}
function SaveCurrentScene() {
  $r5 = GameData.CurrentScene.CurrentAct;
  if (!GameData.SavedSceneData[GameData.CurrentScene.Name]) {
    GameData.SavedScenes.push(GameData.CurrentScene.Name);
    GameData.SavedScenes.sort();
    makeListMenu(Interface.SavedSceneMenu, "SavedScenes", 100, 100);
    PositionMenu(Interface.SavedSceneMenu, "C", "C", 117, -238, Interface.MainMenu, Interface.MainMenu);
    GameData.SavedSceneData[GameData.CurrentScene.Name] = new Object();
    GameData.SavedSceneData[GameData.CurrentScene.Name].Acts = new Array();
    GameData.SavedSceneData[GameData.CurrentScene.Name].ActID = 0;
    GameData.SavedSceneData[GameData.CurrentScene.Name].ActID = GameData.SavedSceneData[GameData.CurrentScene.Name].ActID + 1;
    $r2 = "Act" + GameData.SavedSceneData[GameData.CurrentScene.Name].ActID;
    GameData.SavedSceneData[GameData.CurrentScene.Name].Acts.push($r2);
    GameData.CurrentScene.CurrentAct = 0;
  } else {
    if (GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SavedSceneData[GameData.CurrentScene.Name].Acts[$r5]]) {
      $r2 = GameData.SavedSceneData[GameData.CurrentScene.Name].Acts[$r5];
      GameData.CurrentScene.CurrentAct = $r5;
    } else {
      GameData.SavedSceneData[GameData.CurrentScene.Name].ActID = GameData.SavedSceneData[GameData.CurrentScene.Name].ActID + 1;
      $r2 = "Act" + GameData.SavedSceneData[GameData.CurrentScene.Name].ActID;
      GameData.SavedSceneData[GameData.CurrentScene.Name].Acts.push($r2);
      GameData.CurrentScene.CurrentAct = GameData.SavedSceneData[GameData.CurrentScene.Name].Acts.length - 1;
    }
  }
  GameData.SavedSceneData[GameData.CurrentScene.Name].Ver = GameData.Version;
  GameData.SavedSceneData[GameData.CurrentScene.Name].Prev = GameData.CurrentScene.Prev;
  GameData.SavedSceneData[GameData.CurrentScene.Name].Next = GameData.CurrentScene.Next;
  GameData.SavedSceneData[GameData.CurrentScene.Name][$r2] = new Array();
  GameData.SavedSceneData[GameData.CurrentScene.Name][$r2].push(["Background", GameData.BG, bg._x + ":" + bg._y + ":" + bg._xscale + ":" + bg._yscale + ":" + bg._rotation + ":" + Dimmer._alpha + ":" + GameData.Friction + ":" + GameData.BGAutoScale + ":" + bg.Anim._currentframe]);
  i = GameData.Depths.StageList.length - 1;
  while (!(i < 0)) {
    $r1 = GameData.Depths.StageList[i].Name;
    if ((GameData.Depths.StageList[i].Type == "Characters")) {
      GameData.SavedSceneData[GameData.CurrentScene.Name][$r2].push(["Character", getDNA(GameData.Characters[$r1]), stage[$r1]._x + ":" + stage[$r1]._y + ":" + stage[$r1]._rotation + ":" + stage[$r1].XFace + ":" + stage[$r1].YFace]);
    } else {
      if ((GameData.Depths.StageList[i].Type == "Objects")) {
        GameData.SavedSceneData[GameData.CurrentScene.Name][$r2].push(["Object", GameData.Objects[$r1].Type, stage[$r1]._x + ":" + stage[$r1]._y + ":" + stage[$r1].XFace + ":" + stage[$r1].YFace + ":" + GameData.Objects[$r1].Name + ":" + GameData.Objects[$r1].Scale + ":" + stage[$r1].Obj._currentframe + ":" + stage[$r1]._rotation]);
      } else {
        if ((GameData.Depths.StageList[i].Type == "Clusters")) {
          GameData.SavedSceneData[GameData.CurrentScene.Name][$r2].push(["Cluster", GameData.Clusters[$r1].Type, stage[$r1]._x + ":" + stage[$r1]._y + ":" + stage[$r1].XFace + ":" + stage[$r1].YFace + ":" + GameData.Clusters[$r1].cFrame + ":" + GameData.Clusters[$r1].Name + ":" + GameData.Clusters[$r1].Rows + ":" + GameData.Clusters[$r1].Cols + ":" + GameData.Clusters[$r1].Spread + ":" + GameData.Clusters[$r1].Distance + ":" + GameData.Clusters[$r1].StartDist + ":" + GameData.Clusters[$r1].Px + ":" + GameData.Clusters[$r1].Py + ":" + GameData.Clusters[$r1].Dir + ":" + GameData.Clusters[$r1].Scale + ":" + GameData.Clusters[$r1].Spiral + ":" + GameData.Clusters[$r1].RMod + ":" + stage[$r1]._rotation]);
        } else {
          if ((GameData.Depths.StageList[i].Type == "SpeechBubbles")) {
            $r3 = stage[$r1].D.text.split(":");
            $r4 = $r3.join("//cln//");
            GameData.SavedSceneData[GameData.CurrentScene.Name][$r2].push(["Bubble", GameData.SpeechBubbles[$r1].Type, GameData.SpeechBubbles[$r1].Name + ":" + GameData.SpeechBubbles[$r1].Scale + ":" + GameData.SpeechBubbles[$r1].XScale + ":" + GameData.SpeechBubbles[$r1].YScale + ":" + GameData.SpeechBubbles[$r1].FontColor + ":" + stage[$r1]._x + ":" + stage[$r1]._y + ":" + stage[$r1]._rotation + ":" + stage[$r1].Bubble.XFace + ":" + stage[$r1].Bubble.YFace + ":" + stage[$r1].Bubble._x + ":" + stage[$r1].Bubble._y + ":" + stage[$r1].Bubble._rotation + ":" + stage[$r1].D._x + ":" + stage[$r1].D._y + ":" + stage[$r1].D._rotation + ":" + $r4 + ":" + stage[$r1].FontType]);
          } else {
            if ((GameData.Depths.StageList[i].Type == "Image")) {
              trace(GameData.Screenshots[$r1].Scale);
              GameData.SavedSceneData[GameData.CurrentScene.Name][$r2].push(["Image", GameData.Screenshots[$r1].Src, stage[$r1]._x + ":" + stage[$r1]._y + ":" + stage[$r1].XFace + ":" + stage[$r1].YFace + ":" + GameData.Screenshots[$r1].Name + ":" + GameData.Screenshots[$r1].Scale + ":" + stage[$r1]._rotation + ":" + GameData.Screenshots[$r1].ColorMode + ":" + GameData.Screenshots[$r1].Blur + ":" + GameData.Screenshots[$r1].BlurSettings.X + ":" + GameData.Screenshots[$r1].BlurSettings.Y + ":" + GameData.Screenshots[$r1].BlurSettings.Q]);
            } else {
              if ((GameData.Depths.StageList[i].Type == "Rain")) {
                GameData.SavedSceneData[GameData.CurrentScene.Name][$r2].push(["Rain", GameData.Rain[$r1].Type, stage[$r1]._x + ":" + stage[$r1]._y + ":" + stage[$r1].XFace + ":" + stage[$r1].YFace + ":" + GameData.Rain[$r1].Name + ":" + GameData.Rain[$r1].Scale + ":" + GameData.Rain[$r1].Qty + ":" + GameData.Rain[$r1].Rmin + ":" + GameData.Rain[$r1].Rmax + ":" + GameData.Rain[$r1].Xmin + ":" + GameData.Rain[$r1].Xmax + ":" + GameData.Rain[$r1].Ymin + ":" + GameData.Rain[$r1].Ymax + ":" + GameData.Rain[$r1].Px + ":" + GameData.Rain[$r1].Py + ":" + GameData.Rain[$r1].cFrame]);
              }
            }
          }
        }
      }
    }
    i = i - 1;
  }
  Interface.SceneFrame.bName.text = GameData.CurrentScene.Name + " : Part " + (GameData.CurrentScene.CurrentAct + 1);
  RefreshActList();
}
function applyFilters(tS) {
  if (!tS) {
    tS = GameData.Target._name;
  }
  $r1 = [];
  if ((GameData.Screenshots[tS].ColorMode == "greyscale")) {
    $r1.push(grayfilter);
  } else {
    if ((GameData.Screenshots[tS].ColorMode == "inverse")) {
      $r1.push(inversefilter);
    } else {
      $r1.push(colorfilter);
    }
  }
  if (GameData.Screenshots[tS].Blur) {
    $r3 = GameData.Screenshots[tS].BlurSettings;
    $r4 = new flash.filters.BlurFilter($r3.X, $r3.Y, $r3.Q);
    $r1.push($r4);
  }
  stage[tS].pic.filters = $r1;
}
function addButton(W, N, X, Y, T, A) {
  GameData.Frames[W][N] = new Object();
  GameData.Frames[W][N].Type = "Button";
  GameData.Frames[W][N].X = X;
  GameData.Frames[W][N].Y = Y;
  GameData.Frames[W][N].Text = T;
  GameData.Frames[W][N].Action = A;
}
function addWindow(N, H, W, T) {
  GameData.Frames[N] = new Object();
  GameData.Frames[N].Height = H;
  GameData.Frames[N].Width = W;
  GameData.Frames[N].Title = new Object();
  GameData.Frames[N].Title.Type = "Text";
  GameData.Frames[N].Title.Format = "Header";
  GameData.Frames[N].Title.Text = T;
  GameData.Frames[N].Title.X = 10;
  GameData.Frames[N].Title.Y = 10;
  GameData.Frames[N].Title.Width = 280;
  GameData.Frames[N].Title.Height = 28;
  GameData.Frames[N].Line = new Object();
  GameData.Frames[N].Line.Type = "Line";
  GameData.Frames[N].Line.X = 10;
  GameData.Frames[N].Line.Y = 38;
  GameData.Frames[N].Line.Size = 280;
}
function addTextInput(W, N, X, Y, Lt, It, H, Lw, Iw) {
  GameData.Frames[W][N + "L"] = new Object();
  GameData.Frames[W][N + "L"].Type = "Text";
  GameData.Frames[W][N + "L"].Format = "Base";
  GameData.Frames[W][N + "L"].Text = Lt;
  GameData.Frames[W][N + "L"].X = X;
  GameData.Frames[W][N + "L"].Y = Y;
  GameData.Frames[W][N + "L"].Width = Lw;
  GameData.Frames[W][N + "L"].Height = H;
  GameData.Frames[W][N + "I"] = new Object();
  GameData.Frames[W][N + "I"].Type = "Text";
  GameData.Frames[W][N + "I"].Input = true;
  GameData.Frames[W][N + "I"].Format = "Base";
  GameData.Frames[W][N + "I"].Text = It;
  GameData.Frames[W][N + "I"].X = X + GameData.Frames[W][N + "L"].Width;
  GameData.Frames[W][N + "I"].Y = Y;
  GameData.Frames[W][N + "I"].Width = Iw;
  GameData.Frames[W][N + "I"].Height = H;
}
function addText(W, N, X, Y, Lt, H, Lw) {
  GameData.Frames[W][N + "L"] = new Object();
  GameData.Frames[W][N + "L"].Type = "Text";
  GameData.Frames[W][N + "L"].Format = "Base";
  GameData.Frames[W][N + "L"].Text = Lt;
  GameData.Frames[W][N + "L"].X = X;
  GameData.Frames[W][N + "L"].Y = Y;
  GameData.Frames[W][N + "L"].Width = Lw;
  GameData.Frames[W][N + "L"].Height = H;
}
function addCheckBox(W, N, X, Y, Lt, H, Lw, Is, cbid) {
  GameData.Frames[W][N + "L"] = new Object();
  GameData.Frames[W][N + "L"].Type = "Text";
  GameData.Frames[W][N + "L"].Format = "Base";
  GameData.Frames[W][N + "L"].Text = Lt;
  GameData.Frames[W][N + "L"].X = X;
  GameData.Frames[W][N + "L"].Y = Y;
  GameData.Frames[W][N + "L"].Width = Lw;
  GameData.Frames[W][N + "L"].Height = H;
  GameData.Frames[W][N + "I"] = new Object();
  GameData.Frames[W][N + "I"].Type = "Checkbox";
  GameData.Frames[W][N + "I"].ID = cbid;
  GameData.Frames[W][N + "I"].X = X + GameData.Frames[W][N + "L"].Width;
  GameData.Frames[W][N + "I"].Y = Y;
  GameData.Frames[W][N + "I"].Scale = Is;
}
function makeFrame(F) {
  $r3 = 0;
  GameData.Menus.DMax = GameData.Menus.DMax + 1;
  Interface.createEmptyMovieClip(F, GameData.Menus.DMax);
  $r3 = $r3 + 1;
  Interface[F].attachMovie("BGBox", "BG", $r3);
  Interface[F].BG._alpha = GameData.Buttons.Opacity;
  setBGDrag(Interface[F].BG);
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    i = $r0;
    if ((i == "Height")) {
      Interface[F].BG._height = GameData.Frames[F][i];
    } else {
      if ((i == "Width")) {
        Interface[F].BG._width = GameData.Frames[F][i];
      } else {
        if ((GameData.Frames[F][i].Type == "Text")) {
          $r3 = $r3 + 1;
          Interface[F].createTextField(i, $r3, GameData.Frames[F][i].X, GameData.Frames[F][i].Y, GameData.Frames[F][i].Width, GameData.Frames[F][i].Height);
          Interface[F][i].embedFonts = true;
          Interface[F][i].setNewTextFormat(GameData.TextFormats[GameData.Frames[F][i].Format]);
          if (GameData.Frames[F][i].Input) {
            Interface[F][i].type = "input";
            Interface[F][i].border = true;
            setFocusHandler(Interface[F][i], GameData.Frames[F][i].Text);
            setOnLoadHandler(Interface[F], i, GameData.Frames[F][i].Text);
          } else {
            Interface[F][i].selectable = false;
          }
          Interface[F][i].text = GameData.Frames[F][i].Text;
        } else {
          if ((GameData.Frames[F][i].Type == "Line")) {
            $r3 = $r3 + 1;
            Interface[F].attachMovie("BlackLine", i, $r3);
            Interface[F][i]._x = GameData.Frames[F][i].X;
            Interface[F][i]._y = GameData.Frames[F][i].Y;
            Interface[F][i]._width = GameData.Frames[F][i].Size;
          } else {
            if ((GameData.Frames[F][i].Type == "Button")) {
              $r3 = $r3 + 1;
              makeButton(Interface[F], i, GameData.Frames[F][i].Text, $r3);
              if ((GameData.Frames[F][i].Text == "isClusterDir")) {
                setOnLoadHandler(Interface[F], i, GameData.Frames[F][i].Text);
              }
              Interface[F][i]._x = GameData.Frames[F][i].X;
              Interface[F][i]._y = GameData.Frames[F][i].Y;
              Interface[F][i].Action = GameData.Frames[F][i].Action;
              function () {
                CallFunction(this);
                SwapColor(this.BG, "Buttons", 1);
              }
              <?>[Interface[F][i]] = "onRelease";
            } else {
              if ((GameData.Frames[F][i].Type == "Checkbox")) {
                $r3 = $r3 + 1;
                Interface[F].attachMovie("Checkbox", i, $r3);
                Interface[F][i]._x = GameData.Frames[F][i].X + 10;
                Interface[F][i]._y = GameData.Frames[F][i].Y + 8;
                Interface[F][i]._xscale = GameData.Frames[F][i].Scale;
                Interface[F][i]._yscale = GameData.Frames[F][i].Scale;
                Interface[F][i].ID = GameData.Frames[F][i].ID;
                function () {
                  Toggle(this, this.ID);
                }
                <?>[Interface[F][i]] = "onRelease";
                setOnLoadHandler(Interface[F], i, GameData.Frames[F][i].ID);
              }
            }
          }
        }
      }
    }
  }
  Interface[F]._visible = false;
  ICenter(Interface[F]);
}
function getArray() {
  if ((GameData.TargetType == "Character")) {
    return "Characters";
  } else {
    if ((GameData.TargetType == "Rain")) {
      return "Rain";
    } else {
      if ((GameData.TargetType == "Object")) {
        return "Objects";
      } else {
        if ((GameData.TargetType == "Screenshot")) {
          return "Screenshots";
        } else {
          if ((GameData.TargetType == "SpeechBubble")) {
            return "SpeechBubbles";
          } else {
            if ((GameData.TargetType == "Cluster")) {
              return "Clusters";
            }
          }
        }
      }
    }
  }
  trace("Unknown Object");
  return "Unknown";
}
function OnLoadHandler(MC) {
  i = 0;
  while ((i < MC.OnLoad.length)) {
    if (GameData.Menus.OnLoad[MC.OnLoad[i][1]]) {
      GameData.Menus.OnLoad[MC.OnLoad[i][1]](MC, i);
    }
    i = i + 1;
  }
}
function Toggle(MC, T) {
  if ((T == "ClusterPoint")) {
    if (GameData.Clusters[GameData.Target._name].TowardsPoint) {
      GameData.Clusters[GameData.Target._name].TowardsPoint = false;
      MC.gotoAndStop(1);
    } else {
      GameData.Clusters[GameData.Target._name].TowardsPoint = true;
      MC.gotoAndStop(2);
    }
    fixClusterShotAngle(GameData.Target, GameData.Clusters[GameData.Target._name].Qt);
  }
}
function setOnLoadHandler(MC, T, A) {
  if (!MC.OnLoad) {
    MC.OnLoad = new Array();
  }
  MC.OnLoad.push([T, A]);
}
function setFocusHandler(T, H) {
  function () {
    GameData.KeyLock = true;
  }
  <?>[T] = "onSetFocus";
  if (GameData.Menus.OnSetFocus[H]) {
    GameData.Menus.OnSetFocus[H](T);
  } else {
    function () {
      GameData.KeyLock = false;
    }
    <?>[T] = "onKillFocus";
  }
}
function DevPositioner(MC) {
  if (GameData.DevMode) {
    function () {
      this.startDrag();
    }
    <?>[MC] = "onPress";
    function () {
      this.stopDrag();
      trace("X: " + this._x + " Y: " + this._y);
    }
    <?>[MC] = "onRelease";
  }
}
function getStageList() {
  s = GameData.Depths.StageList.length - 1;
  while (!(s < 0)) {
    trace(GameData.Depths.StageList[s].Name + ": " + GameData.Depths.StageList[s].Depth);
    s = s - 1;
  }
}
function Find(MC) {
  if (GameData.DevMode) {
    if (MC) {
      MC._visible = true;
      trace("X: " + MC._x + " Y:" + MC._y);
    } else {
      trace("Uh oh! It's really gone.");
    }
  }
}
function newSetting(n, d, I, V) {
  GameData.Settings[n] = new Object();
  GameData.Settings[n].Check = d;
  GameData.Settings[n].Info = I;
  if (V) {
    GameData.Settings[n].Value = V;
  }
}
function ToggleSetting(cb, Op) {
  if (GameData.Settings[Op].Check) {
    GameData.Settings[Op].Check = false;
    cb.gotoAndStop(1);
  } else {
    GameData.Settings[Op].Check = true;
    cb.gotoAndStop(2);
  }
  if (GameData.Settings[Op].Trigger) {
    GameData.Settings[Op].Trigger();
  }
  my_so.data[Op] = GameData.Settings[Op].Check;
  my_so.flush();
}
function CheckOrigin() {
  $r2 = new LoadVars();
  function (success) {
    if (success) {
      GameData.Origin = this.from.toString();
    } else {
      GameData.Origin = "Local";
    }
  }
  <?>[$r2] = "onLoad";
  $r2.load("origin.txt");
}
function LoadSavedData() {
  if ((my_so.data.Hotkeys == undefined)) {
    $r1 = 0;
    while (($r1 < 10)) {
      GameData.Hotkeys.push([true, true, String($r1), String($r1)]);
      $r1 = $r1 + 1;
    }
    my_so.data.Hotkeys = GameData.Hotkeys;
  } else {
    GameData.Hotkeys = my_so.data.Hotkeys;
  }
  if ((my_so.data.SavedChars == undefined)) {
    GameData.SavedChars = new Array();
    my_so.data.SavedChars = GameData.SavedChars;
  } else {
    GameData.SavedChars = my_so.data.SavedChars;
    GameData.SavedChars.sort(Array.CASEINSENSITIVE);
  }
  if ((my_so.data.SavedScenes == undefined)) {
    GameData.SavedSceneData = new Object();
    GameData.SavedScenes = new Array();
    my_so.data.SavedScenes = GameData.SavedSceneData;
  } else {
    GameData.SavedSceneData = my_so.data.SavedScenes;
    GameData.SavedScenes = new Array();
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      S = $r0;
      GameData.SavedScenes.push(S);
    }
    GameData.SavedScenes.sort();
  }
  if ((my_so.data.PongHiScore == undefined)) {
    my_so.data.PongHiScore = GameData.Pong.HiScore;
  } else {
    GameData.Pong.HiScore = my_so.data.PongHiScore;
  }
  if ((my_so.data.DefaultChar == undefined)) {
    my_so.data.DefaultChar = GameData.Settings.DefaultChar.Value;
  } else {
    GameData.Settings.DefaultChar.Value = my_so.data.DefaultChar;
  }
  if ((my_so.data.GameData.Settings.ASpeed.Value == undefined)) {
    my_so.data.GameData.Settings.ASpeed.Value = GameData.GameData.Settings.ASpeed.Value;
  } else {
    GameData.GameData.Settings.ASpeed.Value = my_so.data.GameData.Settings.ASpeed.Value;
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    S = $r0;
    if ((my_so.data[S] == undefined)) {
      if (GameData.Settings[S].Value) {
        my_so.data[S] = GameData.Settings[S].Value;
      } else {
        my_so.data[S] = GameData.Settings[S].Check;
      }
    } else {
      if (GameData.Settings[S].Value) {
        GameData.Settings[S].Value = my_so.data[S];
      } else {
        GameData.Settings[S].Check = my_so.data[S];
      }
    }
  }
}
function newPreset(N, B, E, M, H1, H2, A, S, I, W, Ac) {
  GameData.Presets[N] = new Object();
  GameData.Presets[N].bodyFrame = B;
  GameData.Presets[N].eyeFrame = E;
  GameData.Presets[N].mouthFrame = M;
  GameData.Presets[N].headFrame = H1;
  GameData.Presets[N].hatFrame = H2;
  GameData.Presets[N].armFrame = A;
  GameData.Presets[N].shoeFrame = S;
  GameData.Presets[N].itemFrame = I;
  GameData.Presets[N].wingFrame = W;
  GameData.Presets[N].accFrame = Ac;
}
function compareString(str1, str2, num) {
  $r3 = true;
  l = 0;
  while ((l < num)) {
    if (!(str1.charAt(l) == str2.charAt(l))) {
      trace(str1.charAt(l) + "_" + str2.charAt(l));
      $r3 = false;
    }
    l = l + 1;
  }
  return $r3;
}
function playSound(T) {
  if (!GameData.Settings.Mute.Check) {
    _root.GameData.Sounds[T].start();
  }
}
function setBGDrag(MC) {
  function () {
    this._parent.startDrag();
  }
  <?>[MC] = "onPress";
  function () {
    this._parent.stopDrag();
  }
  <?>[MC] = "onRelease";
  function () {
    this._parent.stopDrag();
  }
  <?>[MC] = "onReleaseOutside";
}
function RefreshActList() {
  GameData.SceneActs = GameData.SavedSceneData[GameData.CurrentScene.Name].Acts;
  makeListMenu(Interface.SceneActMenu, "SceneActs", 100, 0);
  PositionMenu(Interface.SceneActMenu, "C", "C", 117, -138, Interface.SceneFrame, Interface.SceneFrame);
}
function ClearClickHandlers() {
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      RemoveClickHandler(stage[n], "Character");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      RemoveClickHandler(stage[n], "SpeechBubble");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      RemoveClickHandler(stage[n], "Object");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      RemoveClickHandler(stage[n], "Cluster");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      RemoveClickHandler(stage[n], "Rain");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      RemoveClickHandler(stage[n], "Screenshot");
    }
  }
}
function SetClickHandlers() {
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      AddClickHandler(stage[n], "Character");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      AddClickHandler(stage[n], "SpeechBubble");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      AddClickHandler(stage[n], "Object");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      AddClickHandler(stage[n], "Cluster");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      AddClickHandler(stage[n], "Rain");
    }
  }
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    n = $r0;
    if (stage[n].Pin) {
      AddClickHandler(stage[n], "Screenshot");
    }
  }
}
function SwapColor(MC, P, C) {
  $r1 = new Color(MC);
  $r1.setRGB(GameData.Palette[P][C]);
}
function PositionMenu(MC, H, V, X, Y, Xclip, Yclip) {
  GameData.Menus.Targets[MC._name] = MC;
  MC.Valign = V;
  MC.Halign = H;
  MC.Xmod = X;
  MC.Ymod = Y;
  MC.XClip = Xclip;
  MC.YClip = Yclip;
}
function resetRenameMenu() {
  function () {
    Interface.TargetFrame.bName.text = Interface.RenameMenu.iName.text;
    if ((GameData.TargetType == "Character")) {
      GameData.Characters[GameData.Target._name].Name = Interface.RenameMenu.iName.text;
    } else {
      if ((GameData.TargetType == "Object")) {
        GameData.Objects[GameData.Target._name].Name = Interface.RenameMenu.iName.text;
      } else {
        if ((GameData.TargetType == "SpeechBubble")) {
          GameData.SpeechBubbles[GameData.Target._name].Name = Interface.RenameMenu.iName.text;
        } else {
          if ((GameData.TargetType == "Cluster")) {
            GameData.Clusters[GameData.Target._name].Name = Interface.RenameMenu.iName.text;
          } else {
            if ((GameData.TargetType == "Screenshot")) {
              GameData.Screenshots[GameData.Target._name].Name = Interface.RenameMenu.iName.text;
            }
          }
        }
      }
    }
    SwapColor(this.BG, "Buttons", 1);
    CloseMenus(3);
  }
  <?>[Interface.RenameMenu.OK] = "onRelease";
}
function fixScales() {
  SysConsole._y = Stage.height / 2;
  if ((game.Type == "Pong")) {
    pongFixScale();
  }
  $r2 = Math.round(Stage.width * 100 / 550);
  $r1 = Math.round(Stage.height * 100 / 400);
  if (($r2 < $r1)) {
    nFscale = $r2;
  } else {
    nFscale = $r1;
  }
  if (GameData.BGAutoScale) {
    Interface.BGMenu.sX.text = nFscale;
    bg._xscale = nFscale;
    bg._yscale = nFscale;
    bg._x = (Stage.width - 550 * (nFscale / 100)) / 2;
    bg._y = (Stage.height - 400 * (nFscale / 100)) / 2;
  }
  ClearClicker._width = Stage.width;
  ClearClicker._height = Stage.height;
  Dimmer._width = Stage.width;
  Dimmer._height = Stage.height;
  ClickBlocker._width = Stage.width;
  ClickBlocker._height = Stage.height;
  TopDimmer._width = Stage.width;
  TopDimmer._height = Stage.height;
  if (GameData.Menus.AutoScale) {
    nFscale = Math.floor(nFscale / 5) * 5;
    GameData.Menus.Size = nFscale;
    Interface._xscale = GameData.Menus.Size;
    Interface._yscale = GameData.Menus.Size;
  }
}
function openCOMenu() {
  setCharLook(Interface.COMenu.char, GameData.Characters[GameData.Target._name]);
  l = 0;
  while ((l < GameData.PartsArray.length)) {
    if (GameData.Characters[GameData.Target._name].Locks[GameData.PartsArray[l]]) {
      Interface.COMenu["Prev" + l]._visible = false;
      Interface.COMenu["Next" + l]._visible = false;
      Interface.COMenu["Lock" + l].gotoAndStop(2);
    } else {
      Interface.COMenu["Prev" + l]._visible = true;
      Interface.COMenu["Next" + l]._visible = true;
      Interface.COMenu["Lock" + l].gotoAndStop(1);
    }
    l = l + 1;
  }
  Interface.COMenu.cName.text = GameData.Characters[GameData.Target._name].Name;
  Interface.COMenu.cScale.text = GameData.Characters[GameData.Target._name].Scale;
  Interface.COMenu.cRot.text = GameData.Target._rotation;
  Interface.COMenu.cX.text = GameData.Target._x;
  Interface.COMenu.cY.text = GameData.Target._y;
  CloseMenus(1);
  OpenMenu(1, Interface.COMenu, Interface.EditMenu.ID0.BG);
}
function updateCOMenu() {
  if ((GameData.TargetType == "Character")) {
    GameData.TargetType == "Character";
  }
  if (Interface.COMenu._visible) {
    Interface.COMenu.cName.text = GameData.Characters[GameData.Target._name].Name;
    Interface.COMenu.cScale.text = GameData.Characters[GameData.Target._name].Scale;
    Interface.COMenu.cRot.text = GameData.Target._rotation;
    Interface.COMenu.cX.text = GameData.Target._x;
    Interface.COMenu.cY.text = GameData.Target._y;
  }
}
function setMenuPositions() {
  $r1 = new Array();
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    m = $r0;
    $r1.push(m);
  }
  $r2 = 0;
  while (($r1.length > 0)) {
    if (!tFMC($r1, GameData.Menus.Targets[$r1[$r2]].XClip._name)) {
      tFMC($r1, GameData.Menus.Targets[$r1[$r2]].XClip._name);
    }
    if (tFMC($r1, GameData.Menus.Targets[$r1[$r2]].YClip._name)) {
      $r2 = $r2 + 1;
    } else {
      fixMenuScale($r1[$r2]);
      $r1.splice($r2, 1);
    }
    if (!($r2 < $r1.length)) {
      $r2 = 0;
    }
  }
}
function tFMC(tAr, tM) {
  j = 0;
  while ((j < tAr.length)) {
    if ((tAr[j] == tM)) {
      return true;
    }
    j = j + 1;
  }
  return false;
}
function fixMenuScale(m) {
  if ((GameData.Menus.Targets[m].Valign == "T")) {
    GameData.Menus.Targets[m]._y = GameData.Menus.Targets[m].Ymod;
  } else {
    if ((GameData.Menus.Targets[m].Valign == "B")) {
      GameData.Menus.Targets[m]._y = 400 - GameData.Menus.Targets[m]._height + GameData.Menus.Targets[m].Ymod;
    } else {
      if ((GameData.Menus.Targets[m].Valign == "C")) {
        GameData.Menus.Targets[m]._y = GameData.Menus.Targets[m].YClip._y + GameData.Menus.Targets[m].Ymod;
      } else {
        GameData.Menus.Targets[m]._y = 200 - GameData.Menus.Targets[m]._height / 2 + GameData.Menus.Targets[m].Ymod;
      }
    }
  }
  if ((GameData.Menus.Targets[m].Halign == "L")) {
    GameData.Menus.Targets[m]._x = GameData.Menus.Targets[m].Xmod;
  } else {
    if ((GameData.Menus.Targets[m].Halign == "R")) {
      GameData.Menus.Targets[m]._x = 400 - GameData.Menus.Targets[m]._height + GameData.Menus.Targets[m].Xmod;
    } else {
      if ((GameData.Menus.Targets[m].Halign == "C")) {
        GameData.Menus.Targets[m]._x = GameData.Menus.Targets[m].XClip._x + GameData.Menus.Targets[m].Xmod;
      } else {
        GameData.Menus.Targets[m]._x = 200 - GameData.Menus.Targets[m]._height / 2 + GameData.Menus.Targets[m].Xmod;
      }
    }
  }
}
function makeButton(T, N, L, D) {
  T.attachMovie("Button", N, D);
  Center(T[N]);
  T[N].bName.text = L;
  setButtonStyle(T[N]);
}
function makeNewMenu(T, N, D) {
  GameData.Menus.DMax = GameData.Menus.DMax + 1;
  T.createEmptyMovieClip(N, GameData.Menus.DMax);
  T[N].Size = D;
  i = 0;
  while ((i < D)) {
    T[N].attachMovie("MenuItem", "ID" + i, i);
    T[N]["ID" + i]._y = i * 20;
    T[N]["ID" + i].bName.text = "Menu Item " + i;
    setButtonStyle(T[N]["ID" + i]);
    function () {
      CallFunction(this);
      SwapColor(this.BG, "Buttons", 1);
    }
    <?>[T[N]["ID" + i]] = "onRelease";
    i = i + 1;
  }
  T[N]._visible = false;
}
function CallFunction(MC) {
  $r1 = MC.Action.split("-");
  if (($r1.length > 1)) {
    if (($r1[0] == "Open")) {
      GameData.Menus.Functions.OpenMenu(MC, $r1[1], Number($r1[2]));
    } else {
      if (($r1.length == 2)) {
        GameData.Menus.Functions[$r1[0]](MC, $r1[1]);
      }
    }
  } else {
    GameData.Menus.Functions[MC.Action](MC);
  }
}
function AddMenuItem(T, B, F) {
  GameData.Menus[T].Items.push({Action: F, Name: B});
}
function makeMenu(T, N, D, MI, X, Y) {
  T.createEmptyMovieClip(N, D);
  ScaleMenu(T[N]);
  i = 0;
  while ((i < MI.length)) {
    T[N].attachMovie("MenuItem", "ID" + i, i);
    T[N]["ID" + i]._x = X;
    T[N]["ID" + i]._y = i * -20;
    T[N]["ID" + i].bName.text = MI[i];
    if (!(MI[i] == "QuickChange")) {
      setButtonStyle(T[N]["ID" + i]);
    }
    i = i + 1;
  }
  T[N]._y = Y - T[N]._height;
  T[N]._visible = false;
}
function resetHelp() {
  playSound("Pop");
  Interface.HelpWindow.Next._visible = false;
  Interface.HelpWindow.TellMore._visible = false;
  Interface.HelpWindow.WalfasLink._visible = false;
  Interface.HelpWindow.BasicHelpMenu._visible = true;
  Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Intro;
}
function setMenuListener(MC, T, L) {
  if ((MC._parent._name == "PartsMenu")) {
    function () {
      if (!GameData.Locks[this.bName.text]) {
        GameData.Locks[this.bName.text];
      }
      if (GameData.Characters[GameData.Target._name].Locks[this.bName.text]) {
        OpenMenu(L, Interface.HelpWindow, this);
        resetHelp();
        Interface.HelpWindow.BasicHelpMenu._visible = false;
        Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Locks;
        Interface.HelpWindow.Next._visible = true;
        function () {
          Interface.HelpWindow._visible = false;
        }
        <?>[Interface.HelpWindow.Next] = "onRelease";
      } else {
        if (T._visible) {
          CloseMenus(L);
          SwapColor(this.BG, "Buttons", 1);
        } else {
          OpenMenu(L, T, this.BG);
          SwapColor(this.BG, "Buttons", 2);
        }
      }
    }
    <?>[MC] = "onRelease";
  } else {
    if ((T._name == "PresetMenu")) {
      function () {
        i = 0;
        while ((i < 13)) {
          TMFix(Interface.PresetMenu.Ops["ID" + i], "PresetList");
          i = i + 1;
        }
        if (T._visible) {
          CloseMenus(L);
          SwapColor(this.BG, "Buttons", 1);
        } else {
          OpenMenu(L, T, this);
          SwapColor(this.BG, "Buttons", 2);
        }
      }
      <?>[MC] = "onRelease";
    } else {
      function () {
        if (T._visible) {
          CloseMenus(L);
          SwapColor(this.BG, "Buttons", 1);
        } else {
          OpenMenu(L, T, this);
          SwapColor(this.BG, "Buttons", 2);
        }
      }
      <?>[MC] = "onRelease";
    }
  }
  function () {
    if (T._visible) {
      SwapColor(this.BG, "Buttons", 2);
    } else {
      SwapColor(this.BG, "Buttons", 0);
    }
  }
  <?>[MC] = "onReleaseOutside";
  function () {
    if (T._visible) {
      SwapColor(this.BG, "Buttons", 2);
    } else {
      SwapColor(this.BG, "Buttons", 0);
    }
  }
  <?>[MC] = "onRollOut";
}
function NewOpenMenu(MC, T, L) {
  if (T._visible) {
    CloseMenus(L);
  } else {
    OpenMenu(L, T, MC);
  }
}
function addPinPreview(MC) {
  MC.attachMovie("Pin", "pin", 15);
  MC.pin._x = 100;
  MC.pin._y = -7;
  MC.pin._xscale = -30;
  MC.pin._yscale = 30;
  MC.pin._visible = false;
}
function checkLocks(T, M) {
  l = 0;
  while ((l < 10)) {
    if (T.Locks[M["ID" + l].bName.text]) {
      M["ID" + l].checkbox.gotoAndStop(2);
    } else {
      M["ID" + l].checkbox.gotoAndStop(1);
    }
    l = l + 1;
  }
}
function setButtonStyle(MC) {
  SwapColor(MC.BG, "Buttons", 0);
  MC.BG._alpha = GameData.Buttons.Opacity;
  $r3 = new TextFormat();
  $r3.color = GameData.Palette.Buttons[3];
  MC.bName.setTextFormat($r3);
  function () {
    SwapColor(this.BG, "Buttons", 1);
  }
  <?>[MC] = "onRollOver";
  function () {
    SwapColor(this.BG, "Buttons", 0);
  }
  <?>[MC] = "onRollOut";
  function () {
    SwapColor(this.BG, "Buttons", 2);
  }
  <?>[MC] = "onPress";
  function () {
    SwapColor(this.BG, "Buttons", 1);
  }
  <?>[MC] = "onRelease";
  function () {
    SwapColor(this.BG, "Buttons", 0);
  }
  <?>[MC] = "onReleaseOutside";
}
function setManipulator() {
  Manipulator._x = GameData.Target._x;
  Manipulator._y = GameData.Target._y;
  setOrbit(Manipulator.RotateTool, GameData.Target._rotation, 30);
  Manipulator.ScaleTool._x = GameData.Target._xscale / 2;
  Manipulator.ScaleTool._y = GameData.Target._yscale / 2;
  if ((GameData.TargetType == "Cluster")) {
    Manipulator.Positioner._visible = true;
    Manipulator.Positioner._x = GameData.Clusters[GameData.Target._name].Px;
    Manipulator.Positioner._y = GameData.Clusters[GameData.Target._name].Py;
    Manipulator.BScaleTool._visible = false;
    Manipulator.BTextTool._visible = false;
  } else {
    if ((GameData.TargetType == "SpeechBubble")) {
      Manipulator.Positioner._visible = true;
      Manipulator.Positioner._x = GameData.Target.Bubble._x;
      Manipulator.Positioner._y = GameData.Target.Bubble._y;
      Manipulator.BScaleTool._visible = true;
      Manipulator.BScaleTool._x = GameData.Target.Bubble._xscale;
      Manipulator.BScaleTool._y = GameData.Target.Bubble._yscale;
      Manipulator.BTextTool._visible = true;
      Manipulator.BTextTool._x = GameData.Target.D._x;
      Manipulator.BTextTool._y = GameData.Target.D._y;
    } else {
      Manipulator.Positioner._visible = false;
      Manipulator.BScaleTool._visible = false;
      Manipulator.BTextTool._visible = false;
    }
  }
  Manipulator._visible = true;
}
function makeListMenu(MC, T, X, Y) {
  $r5 = 250;
  MC.SMod = 0;
  MC.attachMovie("BGBox", "DaMask", 5);
  MC.DaMask._width = $r5;
  MC.DaMask._height = 240;
  MC.attachMovie("BGBox", "Scrollbar", 6);
  MC.attachMovie("BGBox", "Scrollb", 7);
  if ((T == "BGs")) {
    MC.Scrollbar._x = $r5 - 20;
    MC.Scrollb._x = $r5 - 20;
    MC.Scrollbar._y = 50;
    MC.Scrollb._y = 50;
    MC.Scrollb.Ymod = 50;
  } else {
    MC.Scrollbar._x = $r5 + 1;
    MC.Scrollb._x = $r5 + 1;
    MC.Scrollb.Ymod = 0;
  }
  MC.Scrollbar._width = 10;
  MC.Scrollb._width = 10;
  MC.Scrollbar._height = 240;
  MC.Scrollb._height = 10;
  MC.Scrollbar._alpha = 70;
  SwapColor(MC.Scrollbar, "ScrollBar", 2);
  SwapColor(MC.Scrollb, "ScrollBar", 1);
  MC.Scrollbar.Active = false;
  function () {
    if (this.Active) {
      this.ScrollTo = Math.round(this._ymouse / 32 * 100);
      this._parent.Ops.SBmod = Math.round(this.ScrollTo * this._parent.Ops.Max / 100) - this._parent.Ops.ScrolledT;
      this._parent.Ops.Roll = true;
    }
  }
  <?>[MC.Scrollbar] = "onEnterFrame";
  function () {
    this.Active = true;
  }
  <?>[MC.Scrollbar] = "onPress";
  function () {
    this.Active = false;
  }
  <?>[MC.Scrollbar] = "onRelease";
  function () {
    this.Active = false;
  }
  <?>[MC.Scrollbar] = "onReleaseOutside";
  if ((GameData[T].length > 12)) {
    MC.Scrollbar._visible = true;
    MC.Scrollb._visible = true;
  } else {
    MC.Scrollbar._visible = false;
    MC.Scrollb._visible = false;
  }
  MC.createEmptyMovieClip("Ops", 10);
  MC.Ops.Roll = false;
  MC.Ops.Scrolled = 0;
  MC.Ops.Type = sT;
  MC.Ops.ScrolledT = 0;
  MC.Ops.Top = 0;
  MC.Ops.SBmod = 0;
  MC.Ops.setMask(MC.DaMask);
  MC.Ops.Max = (GameData[T].length - 12) * 20;
  $r7 = (11 - GameData[T].length) * 20;
  if (($r7 < 0)) {
    $r7 = 0;
  }
  i = 0;
  while ((i < 13)) {
    if ((i < GameData[T].length)) {
      MC.Ops.attachMovie("ObjMenuItem", "ID" + i, i);
      MC.Ops["ID" + i].ID = i;
      MC.Ops["ID" + i].BG._width = $r5;
      MC.Ops["ID" + i].bName._width = $r5;
      if ((T == "SavedScenes")) {
        MC.Ops["ID" + i].bName.text = GameData[T][i];
      } else {
        if ((T == "SceneActs")) {
          MC.Ops["ID" + i].bName.text = "Part " + (i + 1);
        } else {
          MC.Ops["ID" + i].bName.text = GameData[T][i][0];
        }
      }
      MC.Ops["ID" + i].bName._x = 5;
      MC.Ops["ID" + i]._y = i * 20 - 2 + $r7;
      MC.Ops["ID" + i]._x = 30;
      MC.Ops["ID" + i].attachMovie("TrashIcon", "delB", 10);
      MC.Ops["ID" + i].delB._xscale = 20;
      MC.Ops["ID" + i].delB._yscale = 20;
      MC.Ops["ID" + i].delB._y = 5;
      MC.Ops["ID" + i].delB._x = 200;
      if ((T == "SavedScenes")) {
        function () {
          Interface.ConfirmBox._x = (Stage.width - Interface.ConfirmBox._width) / 5;
          Interface.ConfirmBox._y = (Stage.height - Interface.ConfirmBox._height) / 5;
          Interface.ConfirmBox.ID = this._parent.ID;
          Interface.ConfirmBox.T = this._parent.BG;
          SwapColor(this._parent.BG, "Buttons", 1);
          Interface.ConfirmBox.D.text = "Are you sure you want to delete " + GameData.SavedScenes[this._parent.ID] + "?";
          OpenMenu(4, Interface.ConfirmBox);
          function () {
            CloseMenus(1);
            delete _root.GameData.SavedSceneData[GameData.SavedScenes[this._parent.ID]];
            _root.GameData.SavedScenes.splice(this._parent.ID, 1);
            makeListMenu(Interface.SavedSceneMenu, "SavedScenes", 100, 100);
            PositionMenu(Interface.SavedSceneMenu, "C", "C", 117, -238, Interface.MainMenu, Interface.MainMenu);
          }
          <?>[Interface.ConfirmBox.OK] = "onRelease";
          function () {
            CloseMenus(4);
            SwapColor(this._parent.T, "Buttons", 0);
          }
          <?>[Interface.ConfirmBox.Cancel] = "onRelease";
        }
        <?>[MC.Ops["ID" + i].delB] = "onRelease";
      } else {
        if ((T == "SceneActs")) {
          MC.Ops["ID" + i].attachMovie("ActArrow", "mUp", 22);
          MC.Ops["ID" + i].mUp._xscale = 20;
          MC.Ops["ID" + i].mUp._yscale = 20;
          MC.Ops["ID" + i].mUp._y = 5;
          MC.Ops["ID" + i].mUp._x = 168;
          function () {
            $r3 = _root.GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SceneActs[this._parent.ID]];
            _root.GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SceneActs[this._parent.ID]] = _root.GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SceneActs[this._parent.ID - 1]];
            _root.GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SceneActs[this._parent.ID - 1]] = $r3;
            if (!(GameData.CurrentScene.CurrentAct == this._parent.ID)) {
              GameData.CurrentScene.CurrentAct == this._parent.ID;
            }
            if ((GameData.CurrentScene.CurrentAct == this._parent.ID - 1)) {
              GameData.Menus.Functions.LoadScene(this, GameData.CurrentScene.Name, GameData.CurrentScene.CurrentAct);
            }
            Sys("Parts " + (this._parent.ID + 1) + " and " + this._parent.ID + " switched.", "Whoosh");
          }
          <?>[MC.Ops["ID" + i].mUp] = "onRelease";
          MC.Ops["ID" + i].attachMovie("ActArrow", "mDown", 33);
          MC.Ops["ID" + i].mDown._xscale = 20;
          MC.Ops["ID" + i].mDown._yscale = -20;
          MC.Ops["ID" + i].mDown._y = 16;
          MC.Ops["ID" + i].mDown._x = 182;
          function () {
            $r3 = _root.GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SceneActs[this._parent.ID]];
            _root.GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SceneActs[this._parent.ID]] = _root.GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SceneActs[this._parent.ID + 1]];
            _root.GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SceneActs[this._parent.ID + 1]] = $r3;
            if (!(GameData.CurrentScene.CurrentAct == this._parent.ID)) {
              GameData.CurrentScene.CurrentAct == this._parent.ID;
            }
            if ((GameData.CurrentScene.CurrentAct == this._parent.ID + 1)) {
              GameData.Menus.Functions.LoadScene(this, GameData.CurrentScene.Name, GameData.CurrentScene.CurrentAct);
            }
            Sys("Parts " + (this._parent.ID + 1) + " and " + (this._parent.ID + 2) + " switched.", "Whoosh");
          }
          <?>[MC.Ops["ID" + i].mDown] = "onRelease";
          if ((i == 0)) {
            MC.Ops["ID" + i].mUp._visible = false;
          } else {
            if ((i == _root.GameData.SavedSceneData[GameData.CurrentScene.Name].Acts.length - 1)) {
              MC.Ops["ID" + i].mDown._visible = false;
            }
          }
          function () {
            Sys("Part " + (this._parent.ID + 1) + " Deleted.", "Death");
            delete _root.GameData.SavedSceneData[GameData.CurrentScene.Name][GameData.SceneActs[this._parent.ID]];
            _root.GameData.SavedSceneData[GameData.CurrentScene.Name].Acts.splice(this._parent.ID, 1);
            if ((GameData.CurrentScene.CurrentAct > this._parent.ID)) {
              GameData.CurrentScene.CurrentAct = GameData.CurrentScene.CurrentAct - 1;
              Interface.SceneFrame.bName.text = GameData.CurrentScene.Name + " : Part " + (GameData.CurrentScene.CurrentAct + 1);
            } else {
              if ((GameData.CurrentScene.CurrentAct == this._parent.ID)) {
                GameData.CurrentScene.CurrentAct = $r0 = GameData.CurrentScene.CurrentAct - 1;
                GameData.Menus.Functions.LoadScene(this, GameData.CurrentScene.Name, $r0);
              }
            }
            RefreshActList();
          }
          <?>[MC.Ops["ID" + i].delB] = "onRelease";
        } else {
          function () {
            Interface.ConfirmBox._x = (Stage.width - Interface.ConfirmBox._width) / 5;
            Interface.ConfirmBox._y = (Stage.height - Interface.ConfirmBox._height) / 5;
            Interface.ConfirmBox.ID = this._parent.ID;
            Interface.ConfirmBox.T = this._parent.BG;
            SwapColor(this._parent.BG, "Buttons", 1);
            Interface.ConfirmBox.D.text = "Are you sure you want to delete " + GameData.SavedChars[this._parent.ID][0] + "?";
            OpenMenu(4, Interface.ConfirmBox);
            function () {
              Sys(GameData.SavedChars[this._parent.ID][0] + " Deleted.", "Death");
              CloseMenus(1);
              _root.GameData.SavedChars.splice(this._parent.ID, 1);
              makeListMenu(Interface.SavedCharMenu, "SavedChars", 100, 100);
              PositionMenu(Interface.SavedCharMenu, "C", "C", 117, -238, Interface.MainMenu, Interface.MainMenu);
            }
            <?>[Interface.ConfirmBox.OK] = "onRelease";
            function () {
              CloseMenus(4);
              SwapColor(this._parent.T, "Buttons", 0);
            }
            <?>[Interface.ConfirmBox.Cancel] = "onRelease";
          }
          <?>[MC.Ops["ID" + i].delB] = "onRelease";
        }
      }
      SwapColor(MC.BG, "Buttons", 0);
      MC.BG._alpha = GameData.Buttons.Opacity;
      $r4 = new TextFormat();
      $r4.color = GameData.Palette.Buttons[3];
      MC.bName.setTextFormat($r4);
      function () {
        this._parent.Roll = true;
        SwapColor(this, "Buttons", 1);
      }
      <?>[MC.Ops["ID" + i].BG] = "onRollOver";
      function () {
        this._parent.Roll = false;
        SwapColor(this, "Buttons", 0);
      }
      <?>[MC.Ops["ID" + i].BG] = "onRollOut";
      function () {
        SwapColor(this, "Buttons", 2);
      }
      <?>[MC.Ops["ID" + i].BG] = "onPress";
      function () {
        SwapColor(this, "Buttons", 0);
      }
      <?>[MC.Ops["ID" + i].BG] = "onReleaseOutside";
      if ((T == "SavedChars")) {
        function () {
          CloseMenus(1);
          makeChar(GameData.SavedChars[this._parent.ID][1]);
          SwapColor(this, "Buttons", 1);
        }
        <?>[MC.Ops["ID" + i].BG] = "onRelease";
      } else {
        if ((T == "SceneActs")) {
          function () {
            CloseMenus(1);
            GameData.Menus.Functions.LoadScene(this, GameData.CurrentScene.Name, this._parent.ID);
            SwapColor(this, "Buttons", 1);
          }
          <?>[MC.Ops["ID" + i].BG] = "onRelease";
        } else {
          if ((T == "SavedScenes")) {
            function () {
              CloseMenus(1);
              GameData.Menus.Functions.LoadScene(this, GameData.SavedScenes[this._parent.ID], 0);
              SwapColor(this, "Buttons", 1);
            }
            <?>[MC.Ops["ID" + i].BG] = "onRelease";
          }
        }
      }
    }
    i = i + 1;
  }
  function () {
    if (this.Roll) {
      if (GameData.Settings.AutoScrollMenu.Check) {
        this.ScrollRate = Math.round((_root._ymouse - (120 + this._parent.SMod) * (Interface._yscale / 100) - this._parent._y) / GameData.MSRate);
      } else {
        this.ScrollRate = 0;
      }
      if (!(this.SBmod == 0)) {
        this.ScrollRate = this.ScrollRate + this.SBmod;
        this.SBmod = 0;
        this.Roll = false;
      }
      if (Key.isDown(16)) {
        this.ScrollRate = this.ScrollRate * 2;
      }
      if ((this.ScrolledT + this.ScrollRate < 0)) {
        this._y = this._y - this.ScrolledT * -1;
        this.Scrolled = this.Scrolled + this.ScrolledT * -1;
        this.ScrolledT = 0;
      } else {
        if ((this.ScrolledT + this.ScrollRate > this.Max)) {
          this._y = this._y - (this.Max - this.ScrolledT);
          this.Scrolled = this.Scrolled + (this.Max - this.ScrolledT);
          this.ScrolledT = this.Max;
        } else {
          this._y = this._y - this.ScrollRate;
          this.Scrolled = this.Scrolled + this.ScrollRate;
          this.ScrolledT = this.ScrolledT + this.ScrollRate;
        }
      }
      if ((this.Scrolled > 20)) {
        while ((this.Scrolled > 20)) {
          this["ID" + this.Top]._y = this["ID" + this.Top]._y + 260;
          this["ID" + this.Top].ID = this["ID" + this.Top].ID + 13;
          TMFix(this["ID" + this.Top], T);
          this.Scrolled = this.Scrolled - 20;
          this.Top = this.Top + 1;
          if ((this.Top == 13)) {
            this.Top = 0;
          }
        }
      } else {
        if ((this.Scrolled < 0)) {
          while ((this.Scrolled < 0)) {
            this.Top = this.Top - 1;
            if ((this.Top < 0)) {
              this.Top = 12;
            }
            this["ID" + this.Top]._y = this["ID" + this.Top]._y - 260;
            this["ID" + this.Top].ID = this["ID" + this.Top].ID - 13;
            TMFix(this["ID" + this.Top], T);
            this.Scrolled = this.Scrolled + 20;
          }
        }
      }
      this._parent.Scrollb._y = Math.round(230 * (this.ScrolledT / this.Max)) + this._parent.Scrollb.Ymod;
    }
  }
  <?>[MC.Ops] = "onEnterFrame";
  MC._visible = false;
}
function makeThumbMenu(MC, T, pT, pX, pY, pS, X, Y, sT) {
  if ((T == "BGs")) {
    $r3 = 250;
  } else {
    $r3 = 200;
  }
  MC.SMod = 0;
  MC.attachMovie("BGBox", "DaMask", 5);
  MC.DaMask._width = $r3;
  MC.DaMask._height = 240;
  MC.attachMovie("BGBox", "Scrollbar", 6);
  MC.attachMovie("BGBox", "Scrollb", 7);
  if ((T == "BGs")) {
    MC.Scrollbar._x = $r3 - 20;
    MC.Scrollb._x = $r3 - 20;
    MC.Scrollbar._y = 50;
    MC.Scrollb._y = 50;
    MC.Scrollb.Ymod = 50;
  } else {
    MC.Scrollbar._x = $r3 + 1;
    MC.Scrollb._x = $r3 + 1;
    MC.Scrollb.Ymod = 0;
  }
  MC.Scrollbar._width = 10;
  MC.Scrollb._width = 10;
  MC.Scrollbar._height = 240;
  MC.Scrollb._height = 10;
  MC.Scrollbar._alpha = 70;
  SwapColor(MC.Scrollbar, "ScrollBar", 2);
  SwapColor(MC.Scrollb, "ScrollBar", 1);
  MC.Scrollbar.Active = false;
  function () {
    if (this.Active) {
      this.ScrollTo = Math.round(this._ymouse / 32 * 100);
      this._parent.Ops.SBmod = Math.round(this.ScrollTo * this._parent.Ops.Max / 100) - this._parent.Ops.ScrolledT;
      this._parent.Ops.Roll = true;
    }
  }
  <?>[MC.Scrollbar] = "onEnterFrame";
  function () {
    this.Active = true;
  }
  <?>[MC.Scrollbar] = "onPress";
  function () {
    this.Active = false;
  }
  <?>[MC.Scrollbar] = "onRelease";
  function () {
    this.Active = false;
  }
  <?>[MC.Scrollbar] = "onReleaseOutside";
  MC.createEmptyMovieClip("Ops", 10);
  MC.Ops.Roll = false;
  MC.Ops.Scrolled = 0;
  MC.Ops.Type = sT;
  MC.Ops.ScrolledT = 0;
  MC.Ops.Top = 0;
  MC.Ops.SBmod = 0;
  if (GameData[T]) {
    MC.Ops.Max = (GameData[T].length - 12) * 20;
  } else {
    MC.Ops.Max = (GameData.Parts[T].length - 12) * 20;
  }
  MC.Ops.setMask(MC.DaMask);
  i = 0;
  while ((i < 13)) {
    MC.Ops.attachMovie("ObjMenuItem", "ID" + i, i);
    MC.Ops["ID" + i].ID = i;
    MC.Ops["ID" + i].BG._width = $r3;
    MC.Ops["ID" + i].bName._width = $r3;
    MC.Ops["ID" + i]._y = i * 20 - 2;
    MC.Ops["ID" + i]._x = 30;
    MC.Ops["ID" + i].pX = pX;
    MC.Ops["ID" + i].pY = pY;
    MC.Ops["ID" + i].pS = pS;
    MC.Ops["ID" + i].attachMovie(pT, "preview", 10);
    if ((T == "Eyes")) {
      MC.Ops["ID" + i].attachMovie("Eye2", "preview2", 9);
    } else {
      if ((T == "Hair")) {
        MC.Ops["ID" + i].attachMovie("Hair2", "preview2", 11);
      }
    }
    TMFix(MC.Ops["ID" + i], T);
    setButtonStyle(MC.Ops["ID" + i]);
    function () {
      MC.Ops.Roll = true;
      SwapColor(this.BG, "Buttons", 1);
    }
    <?>[MC.Ops["ID" + i]] = "onRollOver";
    function () {
      MC.Ops.Roll = false;
      SwapColor(this.BG, "Buttons", 0);
    }
    <?>[MC.Ops["ID" + i]] = "onRollOut";
    if ((T == "BGs")) {
      function () {
        SwapBG(this.ID);
        SwapColor(this.BG, "Buttons", 1);
      }
      <?>[MC.Ops["ID" + i]] = "onRelease";
    } else {
      if ((T == "PresetList")) {
        function () {
          makeChar(GameData.PresetList[this.ID]);
          SwapColor(this.BG, "Buttons", 1);
        }
        <?>[MC.Ops["ID" + i]] = "onRelease";
      } else {
        if ((T == "ObjectList")) {
          function () {
            makeObject(GameData.ObjectList[this.ID][1]);
            SwapColor(this.BG, "Buttons", 1);
          }
          <?>[MC.Ops["ID" + i]] = "onRelease";
        } else {
          function () {
            RootPartSwap(GameData.Target[this._parent.Type], T, this.ID);
            SwapColor(this.BG, "Buttons", 1);
          }
          <?>[MC.Ops["ID" + i]] = "onRelease";
        }
      }
    }
    i = i + 1;
  }
  function () {
    if (this.Roll) {
      if (GameData.Settings.AutoScrollMenu.Check) {
        this.ScrollRate = Math.round((_root._ymouse - (120 + this._parent.SMod) * (Interface._yscale / 100) - this._parent._y) / GameData.MSRate);
      } else {
        this.ScrollRate = 0;
      }
      if (!(this.SBmod == 0)) {
        this.ScrollRate = this.ScrollRate + this.SBmod;
        this.SBmod = 0;
        this.Roll = false;
      }
      if (Key.isDown(16)) {
        this.ScrollRate = this.ScrollRate * 2;
      }
      if ((this.ScrolledT + this.ScrollRate < 0)) {
        this._y = this._y - this.ScrolledT * -1;
        this.Scrolled = this.Scrolled + this.ScrolledT * -1;
        this.ScrolledT = 0;
      } else {
        if ((this.ScrolledT + this.ScrollRate > this.Max)) {
          this._y = this._y - (this.Max - this.ScrolledT);
          this.Scrolled = this.Scrolled + (this.Max - this.ScrolledT);
          this.ScrolledT = this.Max;
        } else {
          this._y = this._y - this.ScrollRate;
          this.Scrolled = this.Scrolled + this.ScrollRate;
          this.ScrolledT = this.ScrolledT + this.ScrollRate;
        }
      }
      if ((this.Scrolled > 20)) {
        while ((this.Scrolled > 20)) {
          this["ID" + this.Top]._y = this["ID" + this.Top]._y + 260;
          this["ID" + this.Top].ID = this["ID" + this.Top].ID + 13;
          TMFix(this["ID" + this.Top], T);
          this.Scrolled = this.Scrolled - 20;
          this.Top = this.Top + 1;
          if ((this.Top == 13)) {
            this.Top = 0;
          }
        }
      } else {
        if ((this.Scrolled < 0)) {
          while ((this.Scrolled < 0)) {
            this.Top = this.Top - 1;
            if ((this.Top < 0)) {
              this.Top = 12;
            }
            this["ID" + this.Top]._y = this["ID" + this.Top]._y - 260;
            this["ID" + this.Top].ID = this["ID" + this.Top].ID - 13;
            TMFix(this["ID" + this.Top], T);
            this.Scrolled = this.Scrolled + 20;
          }
        }
      }
      this._parent.Scrollb._y = Math.round(230 * (this.ScrolledT / this.Max)) + this._parent.Scrollb.Ymod;
    }
  }
  <?>[MC.Ops] = "onEnterFrame";
  if ((MC._name == "BGMenu")) {
    PositionMenu(MC, "C", "C", X, Y, Interface.MainMenu, Interface.MainMenu);
  } else {
    PositionMenu(MC, "C", "C", X, Y, Interface.TargetFrame, Interface.TargetFrame);
  }
  MC._visible = false;
}
function TMFix(MC, T) {
  if (GameData.Parts[T]) {
    MC.preview._x = MC.pX + GameData.Parts[T][MC.ID][2];
    MC.preview._y = MC.pY + GameData.Parts[T][MC.ID][3];
    MC.preview._xscale = MC.pS + GameData.Parts[T][MC.ID][4];
    MC.preview._yscale = MC.pS + GameData.Parts[T][MC.ID][4];
    if ((T == "Eyes")) {
      MC.preview2._x = MC.pX + GameData.Parts[T][MC.ID][2] - 10;
      MC.preview2._y = MC.pY + GameData.Parts[T][MC.ID][3] - 40;
      MC.preview2._xscale = MC.pS + GameData.Parts[T][MC.ID][4];
      MC.preview2._yscale = MC.pS + GameData.Parts[T][MC.ID][4];
    } else {
      if ((T == "Hair")) {
        MC.preview.eye2._visible = false;
        MC.preview2._x = MC.pX + GameData.Parts[T][MC.ID][2];
        MC.preview2._y = MC.pY + GameData.Parts[T][MC.ID][3];
        MC.preview2._xscale = MC.pS + GameData.Parts[T][MC.ID][4];
        MC.preview2._yscale = MC.pS + GameData.Parts[T][MC.ID][4];
      }
    }
    MC.swapDepths(MC.ID);
    if (!(MC.ID < 0)) {
      MC.ID < 0;
    }
    if (!(MC.ID < GameData.Parts[T].length)) {
      MC._visible = false;
    } else {
      MC._visible = true;
      if ((GameData.Parts[T][MC.ID] == "none")) {
        MC.bName.text = "None";
        MC.preview.gotoAndStop(1);
        MC.preview._visible = false;
        MC.preview2._visible = false;
      } else {
        MC.preview._visible = true;
        if ((GameData.Parts[T][MC.ID] == "random")) {
          MC.bName.text = "Random";
          MC.preview.gotoAndPlay(1);
          if ((T == "Hair")) {
            MC.preview.HairColor.gotoAndPlay(1);
          }
        } else {
          MC.bName.text = GameData.Parts[T][MC.ID][0];
          MC.preview.gotoAndStop(GameData.Parts[T][MC.ID][1]);
          if ((T == "Eyes")) {
            if (GameData.Parts[T][MC.ID][5]) {
              MC.preview2._visible = true;
              MC.preview2.gotoAndStop(GameData.Parts[T][MC.ID][5]);
            } else {
              MC.preview2._visible = false;
            }
          } else {
            if ((T == "Hair")) {
              MC.preview.HairColor.gotoAndStop(GameData.Parts[T][MC.ID][1]);
              ColorPalette(MC.preview.HairColor, "0x" + GameData.Parts[T][MC.ID][6]);
              if (GameData.Parts[T][MC.ID][5]) {
                MC.preview2._visible = true;
                MC.preview2.gotoAndStop(GameData.Parts[T][MC.ID][5]);
                MC.preview2.HairColor.gotoAndStop(GameData.Parts[T][MC.ID][5]);
                ColorPalette(MC.preview2.HairColor, "0x" + GameData.Parts[T][MC.ID][6]);
              } else {
                MC.preview2._visible = false;
              }
            }
          }
        }
      }
    }
  } else {
    if ((T == "ObjectList")) {
      MC.preview._x = MC.pX + GameData.ObjectArray[GameData.ObjectList[MC.ID][1]][2];
      MC.preview._y = MC.pY + GameData.ObjectArray[GameData.ObjectList[MC.ID][1]][3];
      MC.preview._xscale = MC.pS + GameData.ObjectArray[GameData.ObjectList[MC.ID][1]][4];
      MC.preview._yscale = MC.pS + GameData.ObjectArray[GameData.ObjectList[MC.ID][1]][4];
    } else {
      MC.preview._x = MC.pX;
      MC.preview._y = MC.pY;
      MC.preview._xscale = MC.pS;
      MC.preview._yscale = MC.pS;
    }
    MC.swapDepths(MC.ID);
    if (!(MC.ID < 0)) {
      MC.ID < 0;
    }
    if (!(MC.ID < GameData[T].length)) {
      MC._visible = false;
    } else {
      MC._visible = true;
      if ((T == "SavedScenes")) {
        MC.bName.text = GameData[T][MC.ID];
      } else {
        if ((T == "SceneActs")) {
          MC.bName.text = "Part " + (MC.ID + 1);
          if ((MC.ID == 0)) {
            MC.mUp._visible = false;
          } else {
            MC.mUp._visible = true;
          }
          if ((MC.ID == _root.GameData.SavedSceneData[GameData.CurrentScene.Name].Acts.length - 1)) {
            MC.mDown._visible = false;
          } else {
            MC.mDown._visible = true;
          }
        } else {
          if ((GameData[T][MC.ID] == "none")) {
            MC.bName.text = "None";
            MC.preview.gotoAndStop(1);
            MC.preview._visible = false;
          } else {
            MC.preview._visible = true;
            if ((T == "PresetList")) {
              MC.preview.hair.eye2._visible = false;
              MC.bName.text = GameData[T][MC.ID];
              if (GameData.Parts.Hats[GameData.Presets[GameData[T][MC.ID]].hatFrame][1]) {
                MC.preview.hat.gotoAndStop(GameData.Parts.Hats[GameData.Presets[GameData[T][MC.ID]].hatFrame][1]);
                MC.preview.hat._visible = true;
              } else {
                MC.preview.hat._visible = false;
              }
              MC.preview.hair.gotoAndStop(GameData.Parts.Hair[GameData.Presets[GameData[T][MC.ID]].headFrame][1]);
              MC.preview.hair.HairColor.gotoAndStop(GameData.Parts.Hair[GameData.Presets[GameData[T][MC.ID]].headFrame][1]);
              if (GameData.Parts.Hair[GameData.Presets[GameData[T][MC.ID]].headFrame][5]) {
                MC.preview.head2.gotoAndStop(GameData.Parts.Hair[GameData.Presets[GameData[T][MC.ID]].headFrame][5]);
                MC.preview.head2.HairColor.gotoAndStop(GameData.Parts.Hair[GameData.Presets[GameData[T][MC.ID]].headFrame][5]);
                MC.preview.head2._visible = true;
              } else {
                MC.preview.head2._visible = false;
              }
              MC.preview.eyes.gotoAndStop(GameData.Parts.Eyes[GameData.Presets[GameData[T][MC.ID]].eyeFrame][1]);
              if (GameData.Parts.Mouth[GameData.Presets[GameData[T][MC.ID]].mouthFrame][1]) {
                MC.preview.mouth.gotoAndStop(GameData.Parts.Mouth[GameData.Presets[GameData[T][MC.ID]].mouthFrame][1]);
                MC.preview.mouth._visible = true;
              } else {
                MC.preview.mouth._visible = false;
              }
              if (GameData.Parts.Acc[GameData.Presets[GameData[T][MC.ID]].accFrame][1]) {
                MC.preview.accessory.gotoAndStop(GameData.Parts.Acc[GameData.Presets[GameData[T][MC.ID]].accFrame][1]);
                MC.preview.accessory._visible = true;
              } else {
                MC.preview.accessory._visible = false;
              }
              ColorPalette(MC.preview.hair.HairColor, "0x" + GameData.Parts.Hair[GameData.Presets[GameData[T][MC.ID]].headFrame][6]);
              ColorPalette(MC.preview.head2.HairColor, "0x" + GameData.Parts.Hair[GameData.Presets[GameData[T][MC.ID]].headFrame][6]);
            } else {
              if ((GameData[T][MC.ID] == "random")) {
                MC.bName.text = "Random";
                MC.preview.play();
              } else {
                if ((T == "ObjectList")) {
                  MC.bName.text = GameData.ObjectList[MC.ID][0];
                  MC.preview.gotoAndStop(GameData.ObjectArray[GameData.ObjectList[MC.ID][1]][1]);
                } else {
                  MC.bName.text = GameData[T][MC.ID][0];
                  MC.preview.gotoAndStop(GameData[T][MC.ID][1]);
                }
              }
            }
          }
        }
      }
    }
  }
}
function ICenter(MC) {
  MC._x = 275 - MC._width / 2;
  MC._y = 200 - MC._height / 2;
}
function OpenMenu(L, M, S) {
  if (!(GameData["L" + L + "Menu"] == M)) {
    CloseMenus(L);
  }
  GameData["L" + L + "Menu"] = M;
  GameData["L" + L + "MenuS"] = S;
  function () {
    SwapColor(this.BG, "Buttons", 2);
  }
  <?>[S] = "onRollOut";
  M._visible = true;
}
function CloseMenus(L) {
  while (!(L > GameData.Menus.Max)) {
    if (GameData["L" + L + "Menu"]) {
      GameData["L" + L + "Menu"]._visible = false;
      SwapColor(GameData["L" + L + "MenuS"].BG, "Buttons", 0);
      function () {
        SwapColor(this.BG, "Buttons", 0);
      }
      <?>[GameData["L" + L + "MenuS"]] = "onRollOut";
    }
    L = L + 1;
  }
}
function fixMenuDepths(Mar) {
  i = 0;
  while ((i < Mar.length)) {
    GameData.Menus.Targets[Mar[i]].swapDepths(GameData.Menus.DMax - 1 - i);
    i = i + 1;
  }
}
function getRGB(R, G, B) {
  $r1 = new Array();
  $r2 = "0x";
  $r1.push(Math.floor(R / 16));
  $r1.push(R - Math.floor(R / 16) * 16);
  $r1.push(Math.floor(G / 16));
  $r1.push(G - Math.floor(G / 16) * 16);
  $r1.push(Math.floor(B / 16));
  $r1.push(B - Math.floor(B / 16) * 16);
  i = 0;
  while ((i < $r1.length)) {
    if (($r1[i] == 10)) {
      $r1[i] = "A";
    } else {
      if (($r1[i] == 11)) {
        $r1[i] = "B";
      } else {
        if (($r1[i] == 12)) {
          $r1[i] = "C";
        } else {
          if (($r1[i] == 13)) {
            $r1[i] = "D";
          } else {
            if (($r1[i] == 14)) {
              $r1[i] = "E";
            } else {
              if (($r1[i] == 15)) {
                $r1[i] = "F";
              }
            }
          }
        }
      }
    }
    $r2 = $r2 + $r1[i];
    i = i + 1;
  }
  return $r2;
}
function toRGB(C) {
  if ((C.toUpperCase() == "A")) {
    return 10;
  } else {
    if ((C.toUpperCase() == "B")) {
      return 11;
    } else {
      if ((C.toUpperCase() == "C")) {
        return 12;
      } else {
        if ((C.toUpperCase() == "D")) {
          return 13;
        } else {
          if ((C.toUpperCase() == "E")) {
            return 14;
          } else {
            if ((C.toUpperCase() == "F")) {
              return 15;
            } else {
              return Number(C);
            }
          }
        }
      }
    }
  }
}
function getFriction(N) {
  return 1 - N / 100;
}
function setOrbit(MC, A, D) {
  A = A - 90;
  $r1 = A * 3.141593 / 180;
  $r3 = D * Math.cos($r1);
  $r2 = D * Math.sin($r1);
  MC._x = $r3;
  MC._y = $r2;
}
function Propel(MC, A, D) {
  A = A - 90;
  $r1 = A * 3.141593 / 180;
  $r3 = D * Math.cos($r1);
  $r2 = D * Math.sin($r1);
  MC.XMov = MC.XMov + $r3;
  MC.YMov = MC.YMov + $r2;
}
function getDist(MC, X, Y) {
  if ((MC._parent._name == "fusionlab")) {
    $r3 = X - ((MC._parent._x + MC._x) * (bg._xscale / 100) + MC._parent._parent._x);
    $r2 = Y - ((MC._parent._y + MC._y) * (bg._yscale / 100) + MC._parent._parent._y);
    return Math.sqrt($r3 * $r3 + $r2 * $r2);
  } else {
    return Math.sqrt((X - MC._x) * (X - MC._x) + (Y - MC._y) * (Y - MC._y));
  }
}
function getMouseAngle(X, Y) {
  $r3 = X - _root._xmouse;
  $r2 = Y - _root._ymouse;
  angle = (0 - Math.atan2($r3, $r2)) / 0.017453;
  return angle;
}
function getAngle(X, Y, X2, Y2) {
  $r2 = X - X2;
  $r1 = Y - Y2;
  angle = (0 - Math.atan2($r2, $r1)) / 0.017453;
  return angle;
}
function getDID(N) {
  i = 0;
  while ((i < GameData.Depths.StageList.length)) {
    if ((GameData.Depths.StageList[i].Name == N)) {
      $r1 = i;
      $r2 = true;
    }
    i = i + 1;
  }
  if ($r2) {
    return $r1;
  } else {
    trace("Doesn't exist in depth array!");
  }
}
function VFlip() {
  if ((GameData.TargetType == "SpeechBubble")) {
    GameData.Target.Bubble.YFace = GameData.Target.Bubble.YFace * -1;
    GameData.Target.Bubble._yscale = GameData.Target.Bubble._yscale * -1;
  } else {
    GameData.Target.YFace = GameData.Target.YFace * -1;
    GameData.Target._yscale = GameData.Target._yscale * -1;
  }
}
function HFlip() {
  if ((GameData.TargetType == "SpeechBubble")) {
    GameData.Target.Bubble.XFace = GameData.Target.Bubble.XFace * -1;
    GameData.Target.Bubble._xscale = GameData.Target.Bubble._xscale * -1;
  } else {
    GameData.Target.XFace = GameData.Target.XFace * -1;
    GameData.Target._xscale = GameData.Target._xscale * -1;
  }
}
function Scramble(MC) {
  MC.Spin = random(200) - 100;
  MC.XMov = random(200) - 100;
  MC.YMov = random(200) - 100;
}
function screenShot(MC) {
  $r2 = new flash.display.BitmapData(Stage.width, Stage.height, true, 0);
  MC.attachBitmap($r2, 10, "auto", true);
  $r5 = new flash.geom.Matrix();
  $r3 = new flash.geom.Matrix();
  $r1 = new flash.geom.Matrix();
  $r1.scale(bg._xscale / 100, bg._yscale / 100);
  $r1.translate(bg._x, bg._y);
  $r4 = new flash.geom.ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
  $r3.concat($r1);
  if (!(GameData.BG == 0)) {
    $r2.draw(bg, $r3, $r4);
  }
  $r2.draw(stage, $r5, $r4);
}
function mimeLook(MC, T) {
  T.head.gotoAndStop(MC.head._currentframe);
  T.head.eye2._visible = MC.head.eye2._visible;
  T.head.eye2.gotoAndStop(MC.head.eye2._currentframe);
  T.head.HairColor.gotoAndStop(MC.head.HairColor._currentframe);
  if (MC.head.HairColor.RGB) {
    ColorPalette(T.head.HairColor, MC.head.HairColor.RGB);
  }
  T.arms.gotoAndStop(MC.arms._currentframe);
  T.legs.gotoAndStop(MC.legs._currentframe);
  T.body.gotoAndStop(MC.body._currentframe);
  T.eyes.gotoAndStop(MC.eyes._currentframe);
  T.hat.gotoAndStop(MC.hat._currentframe);
  T.head2.gotoAndStop(MC.head2._currentframe);
  T.head2.HairColor.gotoAndStop(MC.head2._currentframe);
  if (MC.head.HairColor.RGB) {
    ColorPalette(T.head2.HairColor, MC.head.HairColor.RGB);
  }
  T.accessory.gotoAndStop(MC.accessory._currentframe);
  T.item.gotoAndStop(MC.item._currentframe);
  T.wings.gotoAndStop(MC.wings._currentframe);
  T.mouth.gotoAndStop(MC.mouth._currentframe);
  T.hat._visible = MC.hat._visible;
  T.head2._visible = MC.head2._visible;
  T.accessory._visible = MC.accessory._visible;
  T.arms._visible = MC.arms._visible;
  T.legs._visible = MC.legs._visible;
  T.item._visible = MC.item._visible;
  T.wings._visible = MC.wings._visible;
  T.mouth._visible = MC.mouth._visible;
}
function makePresetChar(T, P, N, D) {
  T.attachMovie("Char", N, D);
  T[N].head.gotoAndStop(GameData.Parts.Hair[GameData.Presets[P].headFrame][1]);
  T[N].head.eye2._visible = false;
  T[N].head.HairColor.gotoAndStop(GameData.Parts.Hair[GameData.Presets[P].headFrame][1]);
  T[N].body.gotoAndStop(GameData.Parts.Body[GameData.Presets[P].bodyFrame][1]);
  T[N].arms.gotoAndStop(GameData.Parts.Arms[GameData.Presets[P].armFrame][1]);
  T[N].legs.gotoAndStop(GameData.Parts.Shoes[GameData.Presets[P].shoeFrame][1]);
  T[N].eyes.gotoAndStop(GameData.Parts.Eyes[GameData.Presets[P].eyeFrame][1]);
  if (GameData.Parts.Hair[GameData.Presets[P].headFrame][5]) {
    T[N].head2.gotoAndStop(GameData.Parts.Hair[GameData.Presets[P].headFrame][5]);
    T[N].head2.HairColor.gotoAndStop(GameData.Parts.Hair[GameData.Presets[P].headFrame][5]);
    T[N].head2._visible = true;
  } else {
    T[N].head2._visible = false;
  }
  if (!(GameData.Parts.Hats[GameData.Presets[P].hatFrame] == "none")) {
    T[N].hat.gotoAndStop(GameData.Parts.Hats[GameData.Presets[P].hatFrame][1]);
    T[N].hat._visible = true;
  } else {
    T[N].hat._visible = false;
  }
  if (!(GameData.Parts.Mouth[GameData.Presets[P].mouthFrame] == "none")) {
    T[N].mouth.gotoAndStop(GameData.Parts.Mouth[GameData.Presets[P].mouthFrame][1]);
    T[N].mouth._visible = true;
  } else {
    T[N].mouth._visible = false;
  }
  if (!(GameData.Parts.Acc[GameData.Presets[P].accFrame] == "none")) {
    T[N].accessory.gotoAndStop(GameData.Parts.Acc[GameData.Presets[P].accFrame][1]);
    T[N].accessory._visible = true;
  } else {
    T[N].accessory._visible = false;
  }
  if (!(GameData.Parts.Back[GameData.Presets[P].wingFrame] == "none")) {
    T[N].wings.gotoAndStop(GameData.Parts.Back[GameData.Presets[P].wingFrame][1]);
    T[N].wings._visible = true;
  } else {
    T[N].wings._visible = false;
  }
  if (!(GameData.Parts.Items[GameData.Presets[P].itemFrame] == "none")) {
    T[N].item.gotoAndStop(GameData.Parts.Items[GameData.Presets[P].itemFrame][1]);
    T[N].item._visible = true;
  } else {
    T[N].item._visible = false;
  }
}
function SetMenu(L, T, S, X, Y) {
  if ((Interface["Level" + L + "Menu"].Type == T)) {
    !(Interface["Level" + L + "Menu"].Type == T);
  }
  if (!Interface["Level" + L + "Menu"]._visible) {
    CloseMenus(L);
    GameData["L" + L + "Menu"] = Interface["Level" + L + "Menu"];
    GameData["L" + L + "MenuS"] = S;
    SwapColor(S.BG, "Buttons", 2);
    function () {
      SwapColor(this.BG, "Buttons", 2);
    }
    <?>[S] = "onRollOut";
    Interface["Level" + L + "Menu"]._visible = true;
    Interface["Level" + L + "Menu"].Type = T;
    Interface["Level" + L + "Menu"]._x = S._x + X + GameData.Menus[T].XMod;
    Interface["Level" + L + "Menu"]._y = S._y + Y - GameData.Menus[T].Items.length * 20 + GameData.Menus[T].YMod;
    i = 0;
    while ((i < Interface["Level" + L + "Menu"].Size)) {
      if ((i < GameData.Menus[T].Items.length)) {
        Interface["Level" + L + "Menu"]["ID" + i]._visible = true;
        Interface["Level" + L + "Menu"]["ID" + i].Action = GameData.Menus[T].Items[i].Action;
        Interface["Level" + L + "Menu"]["ID" + i].bName.text = GameData.Menus[T].Items[i].Name;
        Interface["Level" + L + "Menu"]["ID" + i].bName._width = GameData.Menus[T].Size;
        Interface["Level" + L + "Menu"]["ID" + i].BG._width = GameData.Menus[T].Size;
      } else {
        Interface["Level" + L + "Menu"]["ID" + i]._visible = false;
      }
      i = i + 1;
    }
  } else {
    CloseMenus(L);
  }
}
function fixTargetScale(tScale) {
  GameData[getArray()][GameData.Target._name].Scale = tScale;
  if ((GameData.TargetType == "Rain")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      d = $r0;
      if ((d.substr(0, 4) == "Drop")) {
        fixDropScale(GameData.Target[d]);
      }
    }
  } else {
    if ((GameData.TargetType == "SpeechBubble")) {
      GameData.Target._xscale = tScale;
      GameData.Target._yscale = tScale;
    } else {
      GameData.Target._xscale = tScale * GameData.Target.XFace;
      GameData.Target._yscale = tScale * GameData.Target.YFace;
    }
  }
}
function Target(MC) {
  if (!GameData.GameOn) {
    if (GameData.Characters[MC._name]) {
      if ((MC == stage["Boxing Chen"].Target)) {
        resetBoxingChen();
      }
      CloseMenus(1);
      GameData.Target = MC;
      GameData.TargetType = "Character";
      Interface.TargetFrame._visible = true;
      Interface.TargetFrame.bName.text = GameData.Characters[MC._name].Name;
      Interface.TargetFrame.preview.gotoAndStop(1);
      mimeLook(MC, Interface.TargetFrame.preview.char);
      SwapPart(Interface.TargetFrame.preview.char.hair, "Hair", GameData.Characters[MC._name].headFrame);
      Interface.TargetFrame.preview.char.hair.eye2._visible = GameData.Target.head.eye2._visible;
      Interface.TargetFrame.preview.char.hair.eye2.gotoAndStop(GameData.Target.head.eye2._currentframe);
      ColorPalette(Interface.TargetFrame.preview.char.hair.HairColor, MC.head.HairColor.RGB);
      ColorPalette(Interface.TargetFrame.preview.char.head2.HairColor, MC.head.HairColor.RGB);
      function () {
        SetMenu(1, "CharacterMenu", this, 30, 0);
      }
      <?>[Interface.TargetFrame] = "onRelease";
    } else {
      if (GameData.Screenshots[MC._name]) {
        CloseMenus(1);
        GameData.Target = MC;
        GameData.TargetType = "Screenshot";
        Interface.TargetFrame._visible = true;
        Interface.TargetFrame.bName.text = GameData.Screenshots[MC._name].Name;
        Interface.TargetFrame.preview.gotoAndStop(5);
        function () {
          SetMenu(1, "SSMenu", this, 30, 0);
        }
        <?>[Interface.TargetFrame] = "onRelease";
      } else {
        if (GameData.Objects[MC._name]) {
          CloseMenus(1);
          GameData.Target = MC;
          GameData.TargetType = "Object";
          Interface.TargetFrame._visible = true;
          Interface.TargetFrame.bName.text = GameData.Objects[MC._name].Name;
          Interface.TargetFrame.preview.gotoAndStop(3);
          Interface.TargetFrame.preview.obj.gotoAndStop(GameData.ObjectArray[GameData.Objects[MC._name].Type][1]);
          function () {
            SetMenu(1, "ObjectMenu", this, 30, 0);
          }
          <?>[Interface.TargetFrame] = "onRelease";
        } else {
          if (GameData.Rain[MC._name]) {
            CloseMenus(1);
            GameData.Target = MC;
            GameData.TargetType = "Rain";
            Interface.TargetFrame._visible = true;
            Interface.TargetFrame.bName.text = GameData.Rain[MC._name].Name;
            Interface.TargetFrame.preview.gotoAndStop(3);
            Interface.TargetFrame.preview.obj.gotoAndStop(GameData.ObjectArray[GameData.Rain[MC._name].Type][1]);
            function () {
              SetMenu(1, "RainMenu", this, 30, 0);
            }
            <?>[Interface.TargetFrame] = "onRelease";
          } else {
            if (GameData.Clusters[MC._name]) {
              CloseMenus(1);
              GameData.Target = MC;
              GameData.TargetType = "Cluster";
              Interface.TargetFrame._visible = true;
              Interface.TargetFrame.bName.text = GameData.Clusters[MC._name].Name;
              Interface.TargetFrame.preview.gotoAndStop(3);
              Interface.TargetFrame.preview.obj.gotoAndStop(GameData.ObjectArray[GameData.Clusters[MC._name].Type][1]);
              function () {
                SetMenu(1, "ClusterMenu", this, 30, 0);
              }
              <?>[Interface.TargetFrame] = "onRelease";
            } else {
              if (GameData.Toys[MC._name]) {
                CloseMenus(1);
                GameData.Target = MC;
                GameData.TargetType = "Toy";
                Interface.TargetFrame._visible = true;
                Interface.TargetFrame.bName.text = MC._name;
                Interface.TargetFrame.preview.gotoAndStop(2);
                Interface.TargetFrame.preview.toy.gotoAndStop(GameData.Toys[MC._name].frame);
                if ((GameData.Target._name == "Clone Capsule")) {
                  if ((GameData.Toys["Clone Capsule"].Mode == 4)) {
                    Interface.TargetFrame.preview.toy.lights.play();
                  } else {
                    Interface.TargetFrame.preview.toy.lights.gotoAndStop(GameData.Toys["Clone Capsule"].Mode);
                  }
                  if (GameData.Target.char._visible) {
                    setCharLook(Interface.TargetFrame.preview.toy.char, GameData.Toys["Clone Capsule"].Char);
                    Interface.TargetFrame.preview.toy.char._visible = true;
                  } else {
                    Interface.TargetFrame.preview.toy.char._visible = false;
                  }
                }
                setMenuListener(Interface.TargetFrame, Interface, 1);
                function () {
                  if (Interface[GameData.Target._name + "Menu"]._visible) {
                    CloseMenus(1);
                    SwapColor(this.BG, "Buttons", 1);
                  } else {
                    if (Interface[GameData.Target._name + "EmptyMenu"]._visible) {
                      CloseMenus(1);
                      SwapColor(this.BG, "Buttons", 1);
                    } else {
                      if ((GameData.Target._name == "Clone Capsule")) {
                        GameData.Target._name == "Clone Capsule";
                      }
                      if (!stage["Clone Capsule"].char._visible) {
                        OpenMenu(1, Interface[GameData.Target._name + "EmptyMenu"], this.BG);
                      } else {
                        OpenMenu(1, Interface[GameData.Target._name + "Menu"], this.BG);
                      }
                      SwapColor(this.BG, "Buttons", 2);
                    }
                  }
                }
                <?>[Interface.TargetFrame] = "onRelease";
                function () {
                  if (Interface[GameData.Target._name + "Menu"]._visible) {
                    SwapColor(this.BG, "Buttons", 2);
                  } else {
                    SwapColor(this.BG, "Buttons", 0);
                  }
                }
                <?>[Interface.TargetFrame] = "onRollOut";
              } else {
                if (GameData.SpeechBubbles[MC._name]) {
                  CloseMenus(1);
                  GameData.Target = MC;
                  GameData.TargetType = "SpeechBubble";
                  Interface.TargetFrame._visible = true;
                  Interface.TargetFrame.bName.text = GameData.SpeechBubbles[MC._name].Name;
                  Interface.TargetFrame.preview.gotoAndStop(4);
                  Interface.TargetFrame.preview.bubble.D.text = MC.D.text;
                  Interface.TargetFrame.preview.bubble.Bubble.gotoAndStop(GameData.SpeechBubbles[MC._name].Type);
                  function () {
                    SetMenu(1, "BubbleMenu", this, 30, 0);
                  }
                  <?>[Interface.TargetFrame] = "onRelease";
                } else {
                  GameData.Target = "";
                  Interface.TargetFrame._visible = false;
                  Interface.TargetFrame._visible = false;
                }
              }
            }
          }
        }
      }
    }
    if (GameData.Target.Pin) {
      Interface.TargetFrame.pin._visible = true;
    } else {
      Interface.TargetFrame.pin._visible = false;
    }
    if (GameData.ShowManipulator) {
      GameData.ShowManipulator;
    }
    if (GameData.Target) {
      GameData.Target;
    }
    if (Interface._visible) {
      setManipulator();
    } else {
      Manipulator._visible = false;
    }
    GameData.DLSelect = GameData.Target.getDepth();
  }
}
function SwapPart(T, A, N) {
  if ((GameData.Parts[A][N] == "none")) {
    T._visible = false;
  } else {
    T._visible = true;
    if (!(GameData.Parts[A][N] == "random")) {
      GameData.Parts[A][N] == "random";
    }
    if (!(N < GameData.Parts[A].length)) {
      N = SwapPart(T, A, random(GameData.Parts[A].length));
    } else {
      T.gotoAndStop(GameData.Parts[A][N][1]);
      if ((A == "Eyes")) {
        if ((GameData.Parts[A][N][5] > 0)) {
          T._parent.head.eye2._visible = true;
          T._parent.head.eye2.gotoAndStop(GameData.Parts[A][N][5]);
          T._parent.head.eye2.HairColor.gotoAndStop(GameData.Parts[A][N][5]);
          if ((T._parent == GameData.Target)) {
            Interface.TargetFrame.preview.char.hair.eye2.gotoAndStop(GameData.Parts[A][N][5]);
            Interface.TargetFrame.preview.char.hair.eye2._visible = true;
          }
        } else {
          T._parent.head.eye2._visible = false;
          if ((T._parent == GameData.Target)) {
            Interface.TargetFrame.preview.char.hair.eye2._visible = false;
          }
        }
      } else {
        if ((A == "Hair")) {
          if (GameData.Settings.KeepColor.Check) {
            GameData.Settings.KeepColor.Check;
          }
          if (T.HairColor.RGB) {
            colorHex = T.HairColor.RGB;
          } else {
            colorHex = "0x" + GameData.Parts.Hair[N][6];
          }
          T.HairColor.gotoAndStop(GameData.Parts[A][N][1]);
          ColorPalette(T.HairColor, colorHex);
          if ((GameData.Parts[A][N][5] > 0)) {
            T._parent.head2._visible = true;
            T._parent.head2.gotoAndStop(GameData.Parts[A][N][5]);
            T._parent.head2.HairColor.gotoAndStop(GameData.Parts[A][N][5]);
            ColorPalette(T._parent.head2.HairColor, colorHex);
          } else {
            T._parent.head2._visible = false;
          }
          GameData.Characters[T._parent._name].HairColor = colorHex;
        }
      }
    }
  }
  return N;
}
function AddProp(N, T, L) {
  stage.attachMovie(L, N, GameData.Depths.Max);
  GameData[T][N].Depth = GameData.Depths.Max;
  if (!(T == "Toys")) {
    GameData.Depths.Max = GameData.Depths.Max + 1;
    GameData.Depths.StageList.push({Depth: GameData.Depths.Max, Type: T, Name: N});
    GameData.Depths.StageList.sortOn("Depth", Array.DESCENDING | Array.NUMERIC);
  } else {
    GameData.Depths.Max = GameData.Depths.Max + 1;
  }
}
function AddClickHandler(MC, T) {
  if ((T == "Character")) {
    function () {
      if (GameData.Settings.HeadRotates.Check) {
        clickCheck(this._parent, "rotate");
      } else {
        clickCheck(this._parent, "drag");
      }
    }
    <?>[MC.head] = "onPress";
    setActionRelease(MC.head);
    function () {
      clickCheck(this._parent, "drag");
    }
    <?>[MC.body] = "onPress";
    setActionRelease(MC.body);
  } else {
    if ((T == "SpeechBubble")) {
      setBubbleClickHandlers(MC);
    } else {
      function () {
        clickCheck(this, "drag");
      }
      <?>[MC] = "onPress";
      setActionRelease(MC);
    }
  }
}
function RemoveClickHandler(MC, T) {
  if ((T == "Character")) {
    delete MC.head.onPress;
    delete MC.head.onRelease;
    delete MC.head.onReleaseOutside;
    delete MC.body.onPress;
    delete MC.body.onRelease;
    delete MC.body.onReleaseOutside;
  } else {
    if ((T == "SpeechBubble")) {
      delete MC.Bubble.head.onPress;
      delete MC.Bubble.head.onRelease;
      delete MC.Bubble.head.onReleaseOutside;
      delete MC.Bubble.body.onPress;
      delete MC.Bubble.body.onRelease;
      delete MC.Bubble.body.onReleaseOutside;
    } else {
      delete MC.onPress;
      delete MC.onRelease;
      delete MC.onReleaseOutside;
    }
  }
}
function makeScreenShot() {
  GameData.SSID = GameData.SSID + 1;
  $r1 = "Snapshot" + GameData.SSID;
  stage.createEmptyMovieClip($r1, GameData.Depths.Max);
  stage[$r1].createEmptyMovieClip("pic", 10);
  GameData.Depths.Max = GameData.Depths.Max + 1;
  GameData.Depths.StageList.push({Depth: GameData.Depths.Max, Type: T, Name: $r1});
  GameData.Depths.StageList.sortOn("Depth", Array.DESCENDING | Array.NUMERIC);
  screenShot(stage[$r1].pic);
  stage[$r1].Pin = false;
  stage[$r1].XFace = 1;
  stage[$r1].YFace = 1;
  $r2 = Math.round(stage[$r1].pic._width / 2);
  $r3 = Math.round(stage[$r1].pic._height / 2);
  stage[$r1].pic._x = $r2 * -1;
  stage[$r1].pic._y = $r3 * -1;
  stage[$r1]._x = $r2;
  stage[$r1]._y = $r3;
  GameData.Screenshots[$r1] = new Object();
  GameData.Screenshots[$r1].Name = $r1;
  GameData.Screenshots[$r1].Type = T;
  GameData.Screenshots[$r1].Scale = 100;
  GameData.Screenshots[$r1].BlurSettings = new Object();
  GameData.Screenshots[$r1].BlurSettings.X = 30;
  GameData.Screenshots[$r1].BlurSettings.Y = 30;
  GameData.Screenshots[$r1].BlurSettings.Q = 5;
  AddClickHandler(stage[$r1], "Screenshot");
}
function smoothImageLoad(imgURL, targetMovie) {
  var i = 0;
  i = i + 1;
  if (!(_var["_root.smoothImageLoadTemp" + i] == undefined)) goto L99085;
  tmc = _root.createEmptyMovieClip("smoothImageLoadTemp" + i, _root.getNextHighestDepth());
  tmc.createEmptyMovieClip("ti", tmc.getNextHighestDepth());
  tmc.tm = targetMovie;
  /*with 420*/
  tmcl = new MovieClipLoader();
  function () {
    function () {
      pixelData = new flash.display.BitmapData(ti._width, ti._height, true, 0);
      $r1 = Math.round(ti._width / 2);
      $r2 = Math.round(ti._height / 2);
      pixelData.draw(ti);
      tm.attachBitmap(pixelData, 1, true, true);
      tm._x = $r1 * -1;
      tm._y = $r2 * -1;
      tm.smoothImageLoadComplete();
      removeMovieClip(ti._parent);
    }
    <?>[ti] = "onEnterFrame";
  }
  tmc[tmcl] = "onLoadComplete";
  tmcl.loadClip(imgURL, tmc.ti);
}
function makeImage(url, imgAttr) {
  GameData.SSID = GameData.SSID + 1;
  $r1 = "Snapshot" + GameData.SSID;
  stage.createEmptyMovieClip($r1, GameData.Depths.Max);
  stage[$r1].createEmptyMovieClip("pic", 10);
  GameData.Depths.Max = GameData.Depths.Max + 1;
  GameData.Depths.StageList.push({Depth: GameData.Depths.Max, Type: "Image", Name: $r1});
  GameData.Depths.StageList.sortOn("Depth", Array.DESCENDING | Array.NUMERIC);
  smoothImageLoad(url, stage[$r1].pic);
  GameData.Screenshots[$r1] = new Object();
  GameData.Screenshots[$r1].Type = "Image";
  GameData.Screenshots[$r1].Imported = true;
  GameData.Screenshots[$r1].Src = url;
  GameData.Screenshots[$r1].BlurSettings = new Object();
  if (imgAttr) {
    if (GameData.Settings.PinnedLoading.Check) {
      stage[$r1].Pin = true;
    }
    stage[$r1]._x = imgAttr.X;
    stage[$r1]._y = imgAttr.Y;
    stage[$r1].XFace = imgAttr.XFace;
    stage[$r1].YFace = imgAttr.YFace;
    GameData.Screenshots[$r1].Name = imgAttr.Name;
    GameData.Screenshots[$r1].Scale = imgAttr.Scale;
    stage[$r1]._xscale = imgAttr.Scale * imgAttr.XFace;
    stage[$r1]._yscale = imgAttr.Scale * imgAttr.YFace;
    stage[$r1]._rotation = imgAttr.Rotation;
    GameData.Screenshots[$r1].ColorMode = imgAttr.colorMode;
    GameData.Screenshots[$r1].Blur = imgAttr.Blur;
    GameData.Screenshots[$r1].BlurSettings.X = imgAttr.BlurX;
    GameData.Screenshots[$r1].BlurSettings.Y = imgAttr.BlurY;
    GameData.Screenshots[$r1].BlurSettings.Q = imgAttr.BlurQ;
    applyFilters($r1);
  } else {
    stage[$r1].Pin = false;
    stage[$r1]._x = xM;
    stage[$r1]._y = yM;
    stage[$r1].XFace = 1;
    stage[$r1].YFace = 1;
    GameData.Screenshots[$r1].Name = $r1;
    GameData.Screenshots[$r1].Scale = 100;
    GameData.Screenshots[$r1].ColorMode = "normal";
    GameData.Screenshots[$r1].Blur = false;
    GameData.Screenshots[$r1].BlurSettings.X = 30;
    GameData.Screenshots[$r1].BlurSettings.Y = 30;
    GameData.Screenshots[$r1].BlurSettings.Q = 5;
  }
  AddClickHandler(stage[$r1], "Screenshot");
}
function makeRain(T, Attr) {
  GameData.RainID = GameData.RainID + 1;
  $r1 = "Rain" + GameData.RainID;
  stage.createEmptyMovieClip($r1, GameData.Depths.Max);
  GameData.Depths.Max = GameData.Depths.Max + 1;
  GameData.Depths.StageList.push({Depth: GameData.Depths.Max, Type: "Rain", Name: $r1});
  GameData.Depths.StageList.sortOn("Depth", Array.DESCENDING | Array.NUMERIC);
  if (Attr) {
    stage[$r1]._x = Attr.X;
    stage[$r1]._y = Attr.Y;
    if (GameData.Settings.PinnedLoading.Check) {
      stage[$r1].Pin = true;
    } else {
      stage[$r1].Pin = false;
    }
    stage[$r1].XFace = Attr.XFace;
    stage[$r1].YFace = Attr.YFace;
  } else {
    stage[$r1]._x = Stage.width / 2;
    stage[$r1]._y = Stage.height / 2;
    stage[$r1].Pin = false;
    stage[$r1].XFace = 1;
    stage[$r1].YFace = 1;
  }
  stage[$r1].attachMovie("BGBox", "BG", -10);
  stage[$r1].BG._x = -1 * (Stage.width / 2);
  stage[$r1].BG._y = -1 * (Stage.height / 2);
  stage[$r1].BG._width = Stage.width;
  stage[$r1].BG._height = Stage.height;
  stage[$r1].BG._alpha = 0;
  GameData.Rain[$r1] = new Object();
  GameData.Rain[$r1].Type = T;
  if (Attr) {
    GameData.Rain[$r1].Name = Attr.Name;
    GameData.Rain[$r1].Scale = Attr.Scale;
    stage[$r1]._xscale = Attr.Scale * Attr.XFace;
    stage[$r1]._yscale = Attr.Scale * Attr.YFace;
    GameData.Rain[$r1].Qty = Attr.Qty;
    GameData.Rain[$r1].Qt = 0;
    GameData.Rain[$r1].Rmin = Attr.Rmin;
    GameData.Rain[$r1].Rmax = Attr.Rmax;
    GameData.Rain[$r1].Xmin = Attr.Xmin;
    GameData.Rain[$r1].Xmax = Attr.Xmax;
    GameData.Rain[$r1].Ymin = Attr.Ymin;
    GameData.Rain[$r1].Ymax = Attr.Ymax;
    GameData.Rain[$r1].Px = Attr.Px;
    GameData.Rain[$r1].Py = Attr.Py;
    GameData.Rain[$r1].cFrame = Attr.cFrame;
  } else {
    GameData.Rain[$r1].cFrame = GameData.Target.Obj._currentframe;
    GameData.Rain[$r1].Name = $r1;
    GameData.Rain[$r1].Scale = 100;
    GameData.Rain[$r1].Qty = 7;
    GameData.Rain[$r1].Qt = 0;
    GameData.Rain[$r1].Rmin = 10;
    GameData.Rain[$r1].Rmax = 30;
    GameData.Rain[$r1].Xmin = 5;
    GameData.Rain[$r1].Xmax = 15;
    GameData.Rain[$r1].Ymin = 15;
    GameData.Rain[$r1].Ymax = 20;
    GameData.Rain[$r1].Px = -1 * (Stage.width / 2);
    GameData.Rain[$r1].Py = -1 * (Stage.height / 2);
  }
  GameData.Rain[$r1].mFrame = GameData.Target.Obj._totalframes;
  fixRain(stage[$r1]);
  AddClickHandler(stage[$r1], "Rain");
  return stage[$r1];
}
function fixRain(mc) {
  q = GameData.Rain[mc._name].Qty;
  while ((q < GameData.Rain[mc._name].Qt)) {
    mc["Drop" + q].removeMovieClip();
    q = q + 1;
  }
  i = 0;
  while ((i < GameData.Rain[mc._name].Qty)) {
    if (!mc["Drop" + i]) {
      mc.attachMovie("Objects", "Drop" + i, i);
      mc["Drop" + i].gotoAndStop(GameData.ObjectArray[GameData.Rain[mc._name].Type][1]);
    }
    SetDrop(mc["Drop" + i]);
    mc["Drop" + i].Obj.gotoAndPlay(GameData.Rain[mc._name].cFrame);
    if ((i < GameData.Rain[mc._name].Qty / 4)) {
      mc["Drop" + i].Smod = -50;
    } else {
      if ((i < GameData.Rain[mc._name].Qty / 5 * 4)) {
        mc["Drop" + i].Smod = -25;
      } else {
        mc["Drop" + i].Smod = 0;
      }
    }
    fixDropScale(mc["Drop" + i]);
    GameData.Rain[mc._name].Qt = i;
    i = i + 1;
  }
}
function fixDropScale(mcd) {
  mcd._xscale = GameData.Rain[mcd._parent._name].Scale + mcd.Smod;
  mcd._yscale = GameData.Rain[mcd._parent._name].Scale + mcd.Smod;
}
function SetDrop(mcd) {
  mcd._rotation = 0;
  mcd._y = -50 + GameData.Rain[mcd._parent._name].Py;
  mcd._x = random(Stage.width + 100) - 50 + GameData.Rain[mcd._parent._name].Px;
  mcd.Rot = random(GameData.Rain[mcd._parent._name].Rmax - GameData.Rain[mcd._parent._name].Rmin) + GameData.Rain[mcd._parent._name].Rmin;
  mcd.XMov = random(GameData.Rain[mcd._parent._name].Xmax - GameData.Rain[mcd._parent._name].Xmin) + GameData.Rain[mcd._parent._name].Xmin;
  mcd.YMov = random(GameData.Rain[mcd._parent._name].Ymax - GameData.Rain[mcd._parent._name].Ymin) + GameData.Rain[mcd._parent._name].Ymin;
}
function makeCluster(T, Attr) {
  GameData.ClusterID = GameData.ClusterID + 1;
  $r1 = "Cluster" + GameData.ClusterID;
  stage.createEmptyMovieClip($r1, GameData.Depths.Max);
  GameData.Depths.Max = GameData.Depths.Max + 1;
  GameData.Depths.StageList.push({Depth: GameData.Depths.Max, Type: "Clusters", Name: $r1});
  GameData.Depths.StageList.sortOn("Depth", Array.DESCENDING | Array.NUMERIC);
  if (Attr) {
    stage[$r1]._x = Attr.X;
    stage[$r1]._y = Attr.Y;
    if (GameData.Settings.PinnedLoading.Check) {
      stage[$r1].Pin = true;
    } else {
      stage[$r1].Pin = false;
    }
    stage[$r1].XFace = Attr.XFace;
    stage[$r1].YFace = Attr.YFace;
  } else {
    stage[$r1]._x = Stage.width / 2;
    stage[$r1]._y = Stage.height / 2;
    stage[$r1].Pin = false;
    stage[$r1].XFace = 1;
    stage[$r1].YFace = 1;
  }
  GameData.Clusters[$r1] = new Object();
  GameData.Clusters[$r1].Type = T;
  if (Attr) {
    GameData.Clusters[$r1].cFrame = Attr.cFrame;
    GameData.Clusters[$r1].Name = Attr.Name;
    GameData.Clusters[$r1].Rows = Attr.Rows;
    GameData.Clusters[$r1].Cols = Attr.Cols;
    GameData.Clusters[$r1].Spread = Attr.Spread;
    GameData.Clusters[$r1].Distance = Attr.Dist;
    GameData.Clusters[$r1].StartDist = Attr.SDist;
    GameData.Clusters[$r1].Px = Attr.Px;
    GameData.Clusters[$r1].Py = Attr.Py;
    GameData.Clusters[$r1].Dir = Attr.Dir;
    GameData.Clusters[$r1].Scale = Attr.Scale;
    stage[$r1]._xscale = Attr.Scale * Attr.XFace;
    stage[$r1]._yscale = Attr.Scale * Attr.YFace;
    GameData.Clusters[$r1].Spiral = Attr.Spiral;
    GameData.Clusters[$r1].RMod = Attr.RMod;
    stage[$r1]._rotation = Attr.Rotation;
  } else {
    GameData.Clusters[$r1].cFrame = GameData.Target.Obj._currentframe;
    GameData.Clusters[$r1].Name = $r1;
    GameData.Clusters[$r1].Rows = 3;
    GameData.Clusters[$r1].Cols = 6;
    GameData.Clusters[$r1].Spread = 360;
    GameData.Clusters[$r1].Distance = 200;
    GameData.Clusters[$r1].StartDist = 0;
    GameData.Clusters[$r1].Px = 0;
    GameData.Clusters[$r1].Py = 0;
    GameData.Clusters[$r1].Dir = "Out";
    GameData.Clusters[$r1].Scale = 100;
    GameData.Clusters[$r1].Spiral = 10;
    GameData.Clusters[$r1].RMod = 10;
  }
  GameData.Clusters[$r1].mFrame = GameData.Target.Obj._totalframes;
  GameData.Clusters[$r1].Qt = GameData.Clusters[$r1].Rows * GameData.Clusters[$r1].Cols;
  fixCluster(stage[$r1]);
  AddClickHandler(stage[$r1], "Cluster");
  return stage[$r1];
}
function fixCluster(MC) {
  $r3 = GameData.Clusters[MC._name].Rows * GameData.Clusters[MC._name].Cols;
  $r2 = 0;
  $r5 = GameData.Clusters[MC._name].Spread / GameData.Clusters[MC._name].Cols;
  $r4 = (GameData.Clusters[MC._name].Distance - GameData.Clusters[MC._name].StartDist) / GameData.Clusters[MC._name].Rows;
  $r6 = -1 * (GameData.Clusters[MC._name].Spread / 2);
  q = $r3 - 1;
  while ((q < GameData.Clusters[MC._name].Qt)) {
    MC["Shot" + q].removeMovieClip();
    q = q + 1;
  }
  i = 0;
  while ((i < GameData.Clusters[MC._name].Rows)) {
    j = 0;
    while ((j < GameData.Clusters[MC._name].Cols)) {
      if (($r2 < $r3)) {
        MC.attachMovie("Objects", "Shot" + $r2, $r2);
        MC["Shot" + $r2].gotoAndStop(GameData.ObjectArray[GameData.Clusters[MC._name].Type][1]);
        MC["Shot" + $r2].Obj.gotoAndPlay(GameData.Clusters[MC._name].cFrame);
        MC["Shot" + $r2].Angle = $r6 - (j + 1) * $r5 + i * GameData.Clusters[MC._name].Spiral;
        MC["Shot" + $r2].Dist = (i + 1) * $r4 + GameData.Clusters[MC._name].StartDist;
        setOrbit(MC["Shot" + $r2], MC["Shot" + $r2].Angle, MC["Shot" + $r2].Dist);
        $r2 = $r2 + 1;
      }
      j = j + 1;
    }
    i = i + 1;
  }
  GameData.Clusters[MC._name].Qt = $r2;
  fixClusterShotAngle(MC, $r3);
}
function fixClusterShotAngle(MC, Qmax) {
  $r5 = GameData.Clusters[MC._name].Px;
  $r4 = GameData.Clusters[MC._name].Py;
  if ((GameData.Clusters[MC._name].Dir == "Linear")) {
    q = 0;
    while ((q < Qmax)) {
      MC["Shot" + q]._rotation = getAngle(MC._x, MC._y, MC._x + $r5, MC._y + $r4) + GameData.Clusters[MC._name].RMod - MC["Shot" + q]._parent._rotation;
      q = q + 1;
    }
  } else {
    if ((GameData.Clusters[MC._name].Dir == "Random")) {
      q = 0;
      while ((q < Qmax)) {
        MC["Shot" + q]._rotation = random(360);
        q = q + 1;
      }
    } else {
      if ((GameData.Clusters[MC._name].Dir == "Out")) {
        $r6 = 180;
      } else {
        $r6 = 0;
      }
      q = 0;
      while ((q < Qmax)) {
        $r2 = getCSTruePos(MC["Shot" + q]);
        MC["Shot" + q]._rotation = getAngle($r2.X, $r2.Y, $r5, $r4) + $r6 + GameData.Clusters[MC._name].RMod - MC["Shot" + q]._parent._rotation;
        q = q + 1;
      }
    }
  }
}
function getCSTruePos(MCb) {
  $r6 = MCb.Angle - 90 + MCb._parent._rotation;
  $r2 = $r6 * 3.141593 / 180;
  $r5 = MCb.Dist * Math.cos($r2);
  $r4 = MCb.Dist * Math.sin($r2);
  $r1 = new Object();
  $r1.X = $r5;
  $r1.Y = $r4;
  return $r1;
}
function makeObject(T, Attr) {
  GameData.ObjID = GameData.ObjID + 1;
  $r1 = "Object" + GameData.ObjID;
  AddProp($r1, "Objects", "Objects");
  stage[$r1].gotoAndStop(GameData.ObjectArray[T][1]);
  GameData.Objects[$r1] = new Object();
  GameData.Objects[$r1].Type = T;
  if (Attr) {
    stage[$r1]._x = Attr.X;
    stage[$r1]._y = Attr.Y;
    stage[$r1]._rotation = Attr.Rotation;
    if (GameData.Settings.PinnedLoading.Check) {
      stage[$r1].Pin = true;
    } else {
      stage[$r1].Pin = false;
    }
    stage[$r1].XFace = Attr.XFace;
    stage[$r1].YFace = Attr.YFace;
    GameData.Objects[$r1].Name = Attr.Name;
    GameData.Objects[$r1].Scale = Attr.Scale;
    stage[$r1]._xscale = Attr.XFace * Attr.Scale;
    stage[$r1]._yscale = Attr.YFace * Attr.Scale;
    stage[$r1].Obj.gotoAndPlay(Attr.cFrame);
    GameData.Objects[$r1].cframe = Attr.cFrame;
  } else {
    stage[$r1]._x = Stage.width / 2;
    stage[$r1]._y = Stage.height / 2;
    stage[$r1].Pin = false;
    stage[$r1].XFace = 1;
    stage[$r1].YFace = 1;
    GameData.Objects[$r1].Name = $r1;
    GameData.Objects[$r1].Scale = 100;
    if ((GameData.ObjectArray[T][0] == "Fire")) {
      playSound("Boom");
    }
  }
  AddClickHandler(stage[$r1], "Object");
}
function makeChar(T) {
  GameData.CharID = GameData.CharID + 1;
  $r1 = "Char" + GameData.CharID;
  AddProp($r1, "Characters", "Char");
  stage[$r1].Spin = 0;
  $r2 = 0;
  while (($r2 < GameData.SavedChars.length)) {
    if ((T.toLowerCase() == GameData.SavedChars[$r2][0].toLowerCase())) {
      T = GameData.SavedChars[$r2][1];
    }
    $r2 = $r2 + 1;
  }
  $r5 = T.split("-");
  if (($r5.length > 1)) {
    $r5.length > 1;
  }
  if (($r5[0].toLowerCase() == "dna")) {
    $r5.shift();
    $r15 = $r5.join("-");
    $r4 = $r15.split(":");
    $r16 = $r4[1];
    if ($r4[2]) {
      $r6 = $r4[2];
    } else {
      $r6 = 100;
    }
    $r9 = $r4[3];
    $r7 = $r4[4];
    if (($r4[0] < 3.23)) {
      $r10 = Number($r4[5]) + 1;
      $r17 = GameData.Parts.Hair[$r7][6];
    } else {
      $r10 = $r4[5];
      $r17 = $r4[13];
    }
    if (($r4[0] < 3.2)) {
      $r8 = Number($r4[6]) + 1;
      $r11 = Number($r4[7]) + 1;
    } else {
      $r8 = $r4[6];
      $r11 = $r4[7];
    }
    $r20 = $r4[8];
    $r14 = $r4[9];
    $r19 = $r4[10];
    $r18 = $r4[11];
    $r21 = $r4[12];
    $r12 = stage["Clone Capsule"]._x;
    $r13 = stage["Clone Capsule"]._y;
    if (!$r16) {
      $r16 = "Mutant Clone";
      $r20 = 66;
      $r14 = 36;
    } else {
      $r20 = $r4[8];
      $r14 = $r4[9];
    }
  } else {
    if ((T == "Capsule Clone")) {
      $r16 = GameData.Toys["Clone Capsule"].Char.Name;
      $r10 = GameData.Toys["Clone Capsule"].Char.bodyFrame;
      $r20 = GameData.Toys["Clone Capsule"].Char.eyeFrame;
      $r14 = GameData.Toys["Clone Capsule"].Char.mouthFrame;
      $r9 = GameData.Toys["Clone Capsule"].Char.hatFrame;
      $r7 = GameData.Toys["Clone Capsule"].Char.headFrame;
      $r17 = GameData.Toys["Clone Capsule"].Char.HairColor.substr(2, 6);
      $r8 = GameData.Toys["Clone Capsule"].Char.armFrame;
      $r11 = GameData.Toys["Clone Capsule"].Char.shoeFrame;
      $r21 = GameData.Toys["Clone Capsule"].Char.wingFrame;
      $r19 = GameData.Toys["Clone Capsule"].Char.itemFrame;
      $r18 = GameData.Toys["Clone Capsule"].Char.accFrame;
      $r6 = Number(GameData.Toys["Clone Capsule"].Char.Scale);
      $r12 = stage["Clone Capsule"]._x;
      $r13 = stage["Clone Capsule"]._y;
    } else {
      if (GameData.Presets[T]) {
        $r16 = T;
        $r10 = GameData.Presets[T].bodyFrame;
        $r20 = GameData.Presets[T].eyeFrame;
        $r14 = GameData.Presets[T].mouthFrame;
        $r9 = GameData.Presets[T].hatFrame;
        $r7 = GameData.Presets[T].headFrame;
        $r17 = GameData.Parts.Hair[$r7][6];
        $r8 = GameData.Presets[T].armFrame;
        $r11 = GameData.Presets[T].shoeFrame;
        $r21 = GameData.Presets[T].wingFrame;
        $r18 = GameData.Presets[T].accFrame;
        if (GameData.Settings.PresetWithItems.Check) {
          $r19 = GameData.Presets[T].itemFrame;
        } else {
          $r19 = 0;
        }
        $r6 = 100;
        $r12 = Stage.width / 2;
        $r13 = Stage.height / 2 + 50;
      } else {
        if (T) {
          $r16 = T;
        } else {
          $r16 = $r1;
        }
        $r10 = random(GameData.Parts.Body.length);
        $r20 = random(GameData.Parts.Eyes.length);
        $r14 = random(GameData.Parts.Mouth.length);
        $r9 = random(GameData.Parts.Hats.length);
        $r7 = random(GameData.Parts.Hair.length);
        $r17 = GameData.Parts.Hair[$r7][6];
        $r8 = random(GameData.Parts.Arms.length);
        $r11 = random(GameData.Parts.Shoes.length);
        $r21 = random(GameData.Parts.Back.length);
        $r19 = random(GameData.Parts.Items.length);
        $r18 = random(GameData.Parts.Acc.length);
        $r6 = 100;
        $r12 = Stage.width / 2;
        $r13 = Stage.height / 2 + 50;
      }
    }
  }
  GameData.Characters[$r1] = new Object();
  RootPartSwap(stage[$r1].eyes, "Eyes", String($r20));
  RootPartSwap(stage[$r1].mouth, "Mouth", String($r14));
  RootPartSwap(stage[$r1].hat, "Hats", String($r9));
  RootPartSwap(stage[$r1].item, "Items", String($r19));
  RootPartSwap(stage[$r1].wings, "Back", String($r21));
  RootPartSwap(stage[$r1].accessory, "Acc", String($r18));
  RootPartSwap(stage[$r1].head, "Hair", String($r7));
  RootPartSwap(stage[$r1].body, "Body", String($r10));
  RootPartSwap(stage[$r1].arms, "Arms", String($r8));
  RootPartSwap(stage[$r1].legs, "Shoes", String($r11));
  GameData.Characters[$r1].Name = $r16;
  GameData.Characters[$r1].Scale = $r6;
  GameData.Characters[$r1].Locks = new Object();
  GameData.Characters[$r1].Locks.Mouth = false;
  GameData.Characters[$r1].Locks.Eyes = false;
  GameData.Characters[$r1].Locks.Hair = false;
  GameData.Characters[$r1].Locks.Body = false;
  GameData.Characters[$r1].Locks.Arms = false;
  GameData.Characters[$r1].Locks.Shoes = false;
  GameData.Characters[$r1].Locks.Back = false;
  GameData.Characters[$r1].Locks.Accessory = false;
  GameData.Characters[$r1].Locks.Items = false;
  GameData.Characters[$r1].Locks.Hats = false;
  colorHex = "0x" + $r17;
  GameData.Characters[$r1].HairColor = colorHex;
  ColorPalette(stage[$r1].head.HairColor, colorHex);
  ColorPalette(stage[$r1].head2.HairColor, colorHex);
  stage[$r1].Pin = false;
  stage[$r1]._x = $r12;
  stage[$r1]._y = $r13;
  stage[$r1]._xscale = $r6;
  stage[$r1]._yscale = $r6;
  if ((T == "Capsule Clone")) {
    stage[$r1].XFace = GameData.Toys["Clone Capsule"].Target.XFace;
    stage[$r1].YFace = GameData.Toys["Clone Capsule"].Target.YFace;
    stage[$r1]._xscale = stage[$r1]._xscale * stage[$r1].XFace;
    stage[$r1]._yscale = stage[$r1]._yscale * stage[$r1].YFace;
  } else {
    stage[$r1].XFace = 1;
    stage[$r1].YFace = 1;
  }
  AddClickHandler(stage[$r1], "Character");
  return stage[$r1];
}
function makeSpeechBubble(T, Attr) {
  GameData.BubbleID = GameData.BubbleID + 1;
  $r1 = "Bubble" + GameData.BubbleID;
  AddProp($r1, "SpeechBubbles", "SpeechBubble");
  GameData.SpeechBubbles[$r1] = new Object();
  GameData.SpeechBubbles[$r1].Type = T;
  if (Attr) {
    GameData.SpeechBubbles[$r1].Name = Attr.Name;
    GameData.SpeechBubbles[$r1].Scale = Attr.Scale;
    if (GameData.Settings.PinnedLoading.Check) {
      stage[$r1].Pin = true;
    } else {
      stage[$r1].Pin = false;
    }
    GameData.SpeechBubbles[$r1].XScale = Attr.XScale;
    GameData.SpeechBubbles[$r1].YScale = Attr.YScale;
    GameData.SpeechBubbles[$r1].FontColor = Attr.FontColor;
    stage[$r1].Bubble.gotoAndStop(T);
    stage[$r1]._x = Attr.X;
    stage[$r1]._y = Attr.Y;
    stage[$r1]._rotation = Attr.Rotation;
    stage[$r1]._xscale = Attr.Scale;
    stage[$r1]._yscale = Attr.Scale;
    stage[$r1].Bubble.XFace = Attr.XFace;
    stage[$r1].Bubble.YFace = Attr.YFace;
    stage[$r1].Bubble._x = Attr.BX;
    stage[$r1].Bubble._y = Attr.BY;
    stage[$r1].Bubble._xscale = Attr.XScale * Attr.XFace;
    stage[$r1].Bubble._yscale = Attr.YScale * Attr.YFace;
    stage[$r1].Bubble._rotation = Attr.BRotation;
    $r5 = new TextFormat();
    $r5.color = Attr.FontColor;
    stage[$r1].D.setTextFormat($r5);
    stage[$r1].D.setNewTextFormat($r5);
    stage[$r1].D._x = Attr.TX;
    stage[$r1].D._y = Attr.TY;
    stage[$r1].D._rotation = Attr.TRotation;
    stage[$r1].D.text = Attr.MSG;
    if (Attr.FontType) {
      $r7 = new TextFormat();
      $r7.font = Attr.FontType;
      stage[$r1].FontType = Attr.FontType;
      stage[$r1].D.setTextFormat($r7);
      stage[$r1].D.setNewTextFormat($r7);
    }
  } else {
    stage[$r1].Bubble.gotoAndStop(T);
    if (GameData.Settings.RandomBubbles.Check) {
      $r4 = random(GameData.PresetBubbles["Type" + T].length);
      $r6 = Number(GameData.PresetBubbles["Type" + T][$r4][0]);
      $r9 = Number(GameData.PresetBubbles["Type" + T][$r4][1]);
      $r8 = Number(GameData.PresetBubbles["Type" + T][$r4][2]);
      $r11 = Number(GameData.PresetBubbles["Type" + T][$r4][3]);
      $r10 = Number(GameData.PresetBubbles["Type" + T][$r4][4]);
      GameData.SpeechBubbles[$r1].Scale = $r6;
      stage[$r1]._xscale = $r6;
      stage[$r1]._yscale = $r6;
      GameData.SpeechBubbles[$r1].XScale = $r9;
      GameData.SpeechBubbles[$r1].YScale = $r8;
      stage[$r1].Bubble.XFace = $r11;
      stage[$r1].Bubble.YFace = $r10;
      stage[$r1].Bubble._xscale = $r9 * $r11;
      stage[$r1].Bubble._yscale = $r8 * $r10;
      stage[$r1].Bubble._x = Number(GameData.PresetBubbles["Type" + T][$r4][5]);
      stage[$r1].Bubble._y = Number(GameData.PresetBubbles["Type" + T][$r4][6]);
      stage[$r1].Bubble._rotation = Number(GameData.PresetBubbles["Type" + T][$r4][7]);
      stage[$r1].D._x = Number(GameData.PresetBubbles["Type" + T][$r4][8]);
      stage[$r1].D._y = Number(GameData.PresetBubbles["Type" + T][$r4][9]);
      stage[$r1].D._rotation = Number(GameData.PresetBubbles["Type" + T][$r4][10]);
      stage[$r1].D.text = GameData.PresetBubbles["Type" + T][$r4][11];
      $r7 = new TextFormat();
      $r7.font = GameData.PresetBubbles["Type" + T][$r4][12];
      stage[$r1].FontType = GameData.PresetBubbles["Type" + T][$r4][12];
      stage[$r1].D.setTextFormat($r7);
      stage[$r1].D.setNewTextFormat($r7);
      stage[$r1].XMov = random(51) - 25;
      stage[$r1].YMov = random(51) - 25;
    } else {
      GameData.SpeechBubbles[$r1].Scale = 100;
      GameData.SpeechBubbles[$r1].XScale = 100;
      GameData.SpeechBubbles[$r1].YScale = 100;
      stage[$r1].Bubble.XFace = 1;
      stage[$r1].Bubble.YFace = 1;
      if ((T == 4)) {
        stage[$r1].D._y = 0;
        stage[$r1].D.text = "Double click this to edit text.";
      } else {
        stage[$r1].D.text = "\n\n\nDouble click this to edit text.";
      }
      stage[$r1].FontType = "Wild Words";
    }
    GameData.SpeechBubbles[$r1].Name = $r1;
    GameData.SpeechBubbles[$r1].FontColor = "0x000000";
    stage[$r1]._x = 200;
    stage[$r1]._y = 200;
    stage[$r1].Pin = false;
    playSound("Pop");
  }
  AddClickHandler(stage[$r1], "SpeechBubble");
  return stage[stage[$r1]];
}
function setBubbleClickHandlers(MC) {
  function () {
    clickCheck(this._parent._parent, "rotate");
  }
  <?>[MC.Bubble.head] = "onPress";
  setActionRelease(MC.Bubble.head);
  function () {
    clickCheck(this._parent._parent, "drag");
  }
  <?>[MC.Bubble.body] = "onPress";
  setActionRelease(MC.Bubble.body);
  function () {
    GameData.KeyLock = true;
  }
  <?>[MC.D] = "onSetFocus";
  function () {
    GameData.KeyLock = false;
    setBubble(GameData.Target);
    Interface.TargetFrame.preview.bubble.D.text = GameData.Target.D.text;
  }
  <?>[MC.D] = "onKillFocus";
}
function setKeyLocks(MC) {
  function () {
    GameData.KeyLock = true;
  }
  <?>[MC] = "onSetFocus";
  function () {
    GameData.KeyLock = false;
  }
  <?>[MC] = "onKillFocus";
}
function clickCheck(MC, A) {
  if (GameData.Settings.ClickStopsSpin.Check) {
    MC.Spin = 0;
  }
  MC.XMov = 0;
  MC.YMov = 0;
  if (Key.isDown(16)) {
    Target(MC);
    if ((GameData.TargetType == "Character")) {
      MC.OldScale = Number(GameData.Characters[MC._name].Scale);
      GameData.Xmod = _root._xmouse;
      GameData.Ymod = _root._ymouse;
      GameData.Action = "scale";
    } else {
      if ((GameData.TargetType == "Object")) {
        MC.OldScale = GameData.Objects[MC._name].Scale;
        GameData.Xmod = _root._xmouse;
        GameData.Ymod = _root._ymouse;
        GameData.Action = "scale";
      } else {
        if ((GameData.TargetType == "Screenshot")) {
          MC.OldScale = GameData.Screenshots[MC._name].Scale;
          GameData.Xmod = _root._xmouse;
          GameData.Ymod = _root._ymouse;
          GameData.Action = "scale";
        } else {
          if ((GameData.TargetType == "SpeechBubble")) {
            MC.OldScale = GameData.SpeechBubbles[MC._name].Scale;
            MC.OldXScale = GameData.SpeechBubbles[MC._name].XScale;
            MC.OldYScale = GameData.SpeechBubbles[MC._name].YScale;
            GameData.Xmod = _root._xmouse;
            GameData.Ymod = _root._ymouse;
            GameData.Action = "scale";
          } else {
            MC.OldScale = GameData[getArray()][MC._name].Scale;
            GameData.Xmod = _root._xmouse;
            GameData.Ymod = _root._ymouse;
            GameData.Action = "scale";
          }
        }
      }
    }
  } else {
    if (Key.isDown(17)) {
      Target(MC);
      if ((GameData.TargetType == "SpeechBubble")) {
        GameData.Target.Bubble.startDrag();
      } else {
        if ((GameData.TargetType == "Character")) {
          GameData.TargetType == "Character";
        }
        if (GameData.Settings.HeadRotates.Check) {
          GameData.DoubleClick = GameData.DCrate;
          GameData.Action = "drag";
          GameData.Xmod = _root._xmouse - MC._x;
          GameData.Ymod = _root._ymouse - MC._y;
        } else {
          GameData.DoubleClick = GameData.DCrate;
          GameData.Action = "rotate";
          GameData.Xmod = _root._xmouse - MC._x;
          GameData.Ymod = _root._ymouse - MC._y;
        }
      }
    } else {
      if ((GameData.DoubleClick > 0)) {
        GameData.DoubleClick > 0;
      }
      if ((GameData.Target == MC)) {
        if ((GameData.Target._name == "Grouchy Reimu")) {
          HaxSignBE();
        } else {
          if ((GameData.Target._name == "Clone Capsule")) {
            if (stage["Clone Capsule"].char._visible) {
              activateCloneCapsule();
            } else {
              openDNAInput();
            }
          } else {
            if ((GameData.TargetType == "SpeechBubble")) {
              if ((GameData.Target.D.type == "dynamic")) {
                editBubble(GameData.Target);
              } else {
                setBubble(GameData.Target);
              }
            } else {
              if ((GameData.TargetType == "Object")) {
                OpenMenu(1, Interface.GeneralOptions);
                OnLoadHandler(Interface.GeneralOptions);
              } else {
                if ((GameData.TargetType == "Screenshot")) {
                  GameData.Menus.Functions.OpenWindow(this, "SnapshotOptions");
                } else {
                  if ((GameData.TargetType == "Cluster")) {
                    GameData.Menus.Functions.OpenWindow(this, "ClusterOptions");
                  } else {
                    if ((GameData.TargetType == "Rain")) {
                      GameData.Menus.Functions.OpenWindow(this, "RainOptions");
                    } else {
                      if ((GameData.TargetType == "Character")) {
                        openCOMenu();
                      }
                    }
                  }
                }
              }
            }
          }
        }
      } else {
        GameData.DoubleClick = GameData.DCrate;
        GameData.Action = A;
        GameData.Xmod = _root._xmouse - MC._x;
        GameData.Ymod = _root._ymouse - MC._y;
        Target(MC);
      }
    }
  }
}
function editBubble(MC) {
  MC.D.type = "input";
  MC.D.selectable = true;
  Selection.setFocus(MC.D);
}
function setBubble(MC) {
  MC.D.type = "dynamic";
  MC.D.selectable = false;
}
function setActionRelease(MC) {
  function () {
    releaseHandler();
  }
  <?>[MC] = "onRelease";
  function () {
    releaseHandler();
  }
  <?>[MC] = "onReleaseOutside";
}
function releaseHandler() {
  if ((GameData.TargetType == "Character")) {
    if (stage["Clone Capsule"]._visible) {
      stage["Clone Capsule"]._visible;
    }
    if ((getDist(stage["Clone Capsule"], _root._xmouse, _root._ymouse) < 50)) {
      getDist(stage["Clone Capsule"], _root._xmouse, _root._ymouse) < 50;
    }
    if (!stage["Clone Capsule"].char._visible) {
      injectCloneCapsule(GameData.Target);
    } else {
      if (bg.fusionlab) {
        bg.fusionlab;
      }
      if ((getDist(bg.fusionlab.fusion1, _root._xmouse, _root._ymouse) < 50)) {
        getDist(bg.fusionlab.fusion1, _root._xmouse, _root._ymouse) < 50;
      }
      if (!bg.fusionlab.fusion1.char._visible) {
        injectFusionTank(1, GameData.Target);
      } else {
        if (bg.fusionlab) {
          bg.fusionlab;
        }
        if ((getDist(bg.fusionlab.fusion2, _root._xmouse, _root._ymouse) < 50)) {
          getDist(bg.fusionlab.fusion2, _root._xmouse, _root._ymouse) < 50;
        }
        if (!bg.fusionlab.fusion2.char._visible) {
          injectFusionTank(2, GameData.Target);
        } else {
          if (stage["Mysterious Gap"]._visible) {
            stage["Mysterious Gap"]._visible;
          }
          if ((getDist(stage["Mysterious Gap"], _root._xmouse, _root._ymouse) < 50)) {
            if (!GameData.GameOn) {
              pongStart();
            }
          }
        }
      }
    }
  } else {
    if ((GameData.TargetType == "SpeechBubble")) {
      GameData.Target.Bubble.stopDrag();
    } else {
      if ((GameData.Target._name == "Boxing Chen")) {
        BoxingChenAttack();
      }
    }
  }
  _root.GameData.Action = "";
}
function BringToFront(MC) {
  $r1 = getDID(MC._name);
  $r1 = $r1 - 1;
  while (($r1 > -1)) {
    MC.swapDepths(GameData.Depths.StageList[$r1].Depth);
    $r1 = $r1 - 1;
  }
  fixDepthList();
}
function SendToBack(MC) {
  $r1 = getDID(MC._name);
  $r1 = $r1 + 1;
  while (($r1 < GameData.Depths.StageList.length)) {
    MC.swapDepths(GameData.Depths.StageList[$r1].Depth);
    $r1 = $r1 + 1;
  }
  fixDepthList();
}
function fixDepthList() {
  i = 0;
  while ((i < GameData.Depths.StageList.length)) {
    GameData.Depths.StageList[i].Depth = stage[GameData.Depths.StageList[i].Name].getDepth();
    i = i + 1;
  }
  GameData.Depths.StageList.sortOn("Depth", Array.DESCENDING | Array.NUMERIC);
}
function BringForward(MC) {
  $r1 = getDID(MC._name);
  if (($r1 > 0)) {
    MC.swapDepths(GameData.Depths.StageList[$r1 - 1].Depth);
  }
  fixDepthList();
}
function SendBackward(MC) {
  $r1 = getDID(MC._name);
  if (($r1 < GameData.Depths.StageList.length - 1)) {
    MC.swapDepths(GameData.Depths.StageList[$r1 + 1].Depth);
  }
  fixDepthList();
}
function Delete(MC) {
  $r1 = MC._name;
  if (GameData.Toys[$r1]) {
    if (($r1 == "Boxing Chen")) {
      resetBoxingChen();
    }
    MC._visible = false;
    Target();
  } else {
    if (GameData.Characters[$r1]) {
      delete GameData.Characters[$r1];
    } else {
      if (GameData.SpeechBubbles[$r1]) {
        delete GameData.SpeechBubbles[$r1];
      } else {
        if (GameData.Objects[$r1]) {
          delete GameData.Objects[$r1];
        }
      }
    }
    MC.removeMovieClip();
    if ((MC._name == $r1)) {
      trace("Delete failed! " + MC);
    }
  }
  if ((GameData.Target == MC)) {
    Target();
    CloseMenus(1);
    Manipulator._visible = false;
  }
  GameData.Depths.StageList.splice(getDID($r1), 1);
}
function RandomizeAll(MC) {
  if (!GameData.Characters[MC._name].Locks.Hats) {
    !GameData.Characters[MC._name].Locks.Hats;
  }
  if (!GameData.Locks.Hats) {
    RootPartSwap(MC.hat, "Hats", "random");
  }
  if (!GameData.Characters[MC._name].Locks.Back) {
    !GameData.Characters[MC._name].Locks.Back;
  }
  if (!GameData.Locks.Back) {
    RootPartSwap(MC.wings, "Back", "random");
  }
  if (!GameData.Characters[MC._name].Locks.Items) {
    !GameData.Characters[MC._name].Locks.Items;
  }
  if (!GameData.Locks.Items) {
    RootPartSwap(MC.item, "Items", "random");
  }
  if (!GameData.Characters[MC._name].Locks.Accessory) {
    !GameData.Characters[MC._name].Locks.Accessory;
  }
  if (!GameData.Locks.Accessory) {
    RootPartSwap(MC.accessory, "Acc", "random");
  }
  if (!GameData.Characters[MC._name].Locks.Hair) {
    !GameData.Characters[MC._name].Locks.Hair;
  }
  if (!GameData.Locks.Hair) {
    RootPartSwap(MC.head, "Hair", "random");
  }
  if (!GameData.Characters[MC._name].Locks.Body) {
    !GameData.Characters[MC._name].Locks.Body;
  }
  if (!GameData.Locks.Body) {
    RootPartSwap(MC.body, "Body", "random");
  }
  if (!GameData.Characters[MC._name].Locks.Arms) {
    !GameData.Characters[MC._name].Locks.Arms;
  }
  if (!GameData.Locks.Arms) {
    RootPartSwap(MC.arms, "Arms", "random");
  }
  if (!GameData.Characters[MC._name].Locks.Shoes) {
    !GameData.Characters[MC._name].Locks.Shoes;
  }
  if (!GameData.Locks.Shoes) {
    RootPartSwap(MC.legs, "Shoes", "random");
  }
  if (!GameData.Characters[MC._name].Locks.Eyes) {
    !GameData.Characters[MC._name].Locks.Eyes;
  }
  if (!GameData.Locks.Eyes) {
    RootPartSwap(MC.eyes, "Eyes", "random");
  }
  if (!GameData.Characters[MC._name].Locks.Mouth) {
    !GameData.Characters[MC._name].Locks.Mouth;
  }
  if (!GameData.Locks.Mouth) {
    RootPartSwap(MC.mouth, "Mouth", "random");
  }
}
function RootPartSwap(MC, T, N) {
  if ((N == "random")) {
    $r2 = SwapPart(MC, T, GameData.Parts[T].length - 1);
  } else {
    $r2 = SwapPart(MC, T, Number(N));
  }
  if ((T == "Hats")) {
    GameData.Characters[MC._parent._name].hatFrame = $r2;
  } else {
    if ((T == "Acc")) {
      GameData.Characters[MC._parent._name].accFrame = $r2;
    } else {
      if ((T == "Back")) {
        GameData.Characters[MC._parent._name].wingFrame = $r2;
      } else {
        if ((T == "Items")) {
          GameData.Characters[MC._parent._name].itemFrame = $r2;
        } else {
          if ((T == "Hair")) {
            GameData.Characters[MC._parent._name].headFrame = $r2;
          } else {
            if ((T == "Arms")) {
              GameData.Characters[MC._parent._name].armFrame = $r2;
            } else {
              if ((T == "Shoes")) {
                GameData.Characters[MC._parent._name].shoeFrame = $r2;
              } else {
                if ((T == "Body")) {
                  GameData.Characters[MC._parent._name].bodyFrame = $r2;
                } else {
                  if ((T == "Eyes")) {
                    GameData.Characters[MC._parent._name].eyeFrame = $r2;
                  } else {
                    if ((T == "Mouth")) {
                      GameData.Characters[MC._parent._name].mouthFrame = $r2;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if ((GameData.Target == MC._parent)) {
    if ((T == "Hats")) {
      SwapPart(Interface.TargetFrame.preview.char.hat, T, $r2);
    } else {
      if ((T == "Acc")) {
        SwapPart(Interface.TargetFrame.preview.char.accessory, T, $r2);
      } else {
        if ((T == "Hair")) {
          SwapPart(Interface.TargetFrame.preview.char.hair, T, $r2);
        } else {
          if ((T == "Eyes")) {
            SwapPart(Interface.TargetFrame.preview.char.eyes, T, $r2);
          } else {
            if ((T == "Mouth")) {
              SwapPart(Interface.TargetFrame.preview.char.mouth, T, $r2);
            }
          }
        }
      }
    }
  }
}
function setCharLook(T, S) {
  if (GameData.Parts.Hats[S.hatFrame][1]) {
    T.hat._visible = true;
    T.hat.gotoAndStop(GameData.Parts.Hats[S.hatFrame][1]);
  } else {
    T.hat._visible = false;
  }
  T.head.gotoAndStop(GameData.Parts.Hair[S.headFrame][1]);
  T.head.HairColor.gotoAndStop(GameData.Parts.Hair[S.headFrame][1]);
  if (S.HairColor) {
    ColorPalette(T.head.HairColor, S.HairColor);
  }
  if (GameData.Parts.Eyes[S.eyeFrame][5]) {
    T.head.eye2._visible = true;
    T.head.eye2.gotoAndStop(GameData.Parts.Eyes[S.eyeFrame][5]);
  } else {
    T.head.eye2._visible = false;
  }
  if (GameData.Parts.Hair[S.headFrame][5]) {
    T.head2._visible = true;
    T.head2.gotoAndStop(GameData.Parts.Hair[S.headFrame][5]);
    T.head2.HairColor.gotoAndStop(GameData.Parts.Hair[S.headFrame][5]);
    if (S.HairColor) {
      ColorPalette(T.head2.HairColor, S.HairColor);
    }
  } else {
    T.head2._visible = false;
  }
  if (GameData.Parts.Body[S.bodyFrame][1]) {
    T.body._visible = true;
    T.body.gotoAndStop(GameData.Parts.Body[S.bodyFrame][1]);
  } else {
    T.body._visible = false;
  }
  if (GameData.Parts.Arms[S.armFrame][1]) {
    T.arms._visible = true;
    T.arms.gotoAndStop(GameData.Parts.Arms[S.armFrame][1]);
  } else {
    T.arms._visible = false;
  }
  if (GameData.Parts.Shoes[S.shoeFrame][1]) {
    T.legs._visible = true;
    T.legs.gotoAndStop(GameData.Parts.Shoes[S.shoeFrame][1]);
  } else {
    T.legs._visible = false;
  }
  T.eyes.gotoAndStop(GameData.Parts.Eyes[S.eyeFrame][1]);
  if (GameData.Parts.Items[S.itemFrame][1]) {
    T.item._visible = true;
    T.item.gotoAndStop(GameData.Parts.Items[S.itemFrame][1]);
  } else {
    T.item._visible = false;
  }
  if (GameData.Parts.Back[S.wingFrame][1]) {
    T.wings._visible = true;
    T.wings.gotoAndStop(GameData.Parts.Back[S.wingFrame][1]);
  } else {
    T.wings._visible = false;
  }
  if (GameData.Parts.Acc[S.accFrame][1]) {
    T.accessory._visible = true;
    T.accessory.gotoAndStop(GameData.Parts.Acc[S.accFrame][1]);
  } else {
    T.accessory._visible = false;
  }
  if (GameData.Parts.Mouth[S.mouthFrame][1]) {
    T.mouth._visible = true;
    T.mouth.gotoAndStop(GameData.Parts.Mouth[S.mouthFrame][1]);
  } else {
    T.mouth._visible = false;
  }
}
function QuickSwap(MC, N, T) {
  if (!GameData.Characters[MC._name].Locks.Hats) {
    !GameData.Characters[MC._name].Locks.Hats;
    if (!(T == "Hats")) {
      T == "Hats";
    }
  }
  if ((T == "All")) {
    $r5 = GameData.Characters[MC._name].hatFrame + N;
    if (($r5 < 1)) {
      $r5 = GameData.Parts.Hats.length - 2;
    } else {
      if (($r5 > GameData.Parts.Hats.length - 2)) {
        $r5 = 1;
      }
    }
    RootPartSwap(MC.hat, "Hats", String($r5));
  }
  if (!GameData.Characters[MC._name].Locks.Eyes) {
    !GameData.Characters[MC._name].Locks.Eyes;
    if (!(T == "Eyes")) {
      T == "Eyes";
      if ((T == "All")) {
        T == "All";
      }
    }
  }
  if (!GameData.Settings.OldQS.Check) {
    $r11 = GameData.Characters[MC._name].eyeFrame + N;
    if (($r11 < 0)) {
      $r11 = GameData.Parts.Eyes.length - 2;
    } else {
      if (($r11 > GameData.Parts.Eyes.length - 2)) {
        $r11 = 0;
      }
    }
    RootPartSwap(MC.eyes, "Eyes", String($r11));
  }
  if (!GameData.Characters[MC._name].Locks.Mouth) {
    !GameData.Characters[MC._name].Locks.Mouth;
    if (!(T == "Mouth")) {
      T == "Mouth";
      if ((T == "All")) {
        T == "All";
      }
    }
  }
  if (!GameData.Settings.OldQS.Check) {
    $r8 = GameData.Characters[MC._name].mouthFrame + N;
    if (($r8 < 1)) {
      $r8 = GameData.Parts.Mouth.length - 2;
    } else {
      if (($r8 > GameData.Parts.Mouth.length - 2)) {
        $r8 = 1;
      }
    }
    RootPartSwap(MC.mouth, "Mouth", String($r8));
  }
  if (!GameData.Characters[MC._name].Locks.Hair) {
    !GameData.Characters[MC._name].Locks.Hair;
    if (!(T == "Hair")) {
      T == "Hair";
    }
  }
  if ((T == "All")) {
    $r7 = GameData.Characters[MC._name].headFrame + N;
    if (($r7 < 0)) {
      $r7 = GameData.Parts.Hair.length - 2;
    } else {
      if (($r7 > GameData.Parts.Hair.length - 2)) {
        $r7 = 0;
      }
    }
    RootPartSwap(MC.head, "Hair", String($r7));
  }
  if (!GameData.Characters[MC._name].Locks.Arms) {
    !GameData.Characters[MC._name].Locks.Arms;
    if (!(T == "Arms")) {
      T == "Arms";
    }
  }
  if ((T == "All")) {
    $r4 = GameData.Characters[MC._name].armFrame + N;
    if (($r4 < 0)) {
      $r4 = GameData.Parts.Arms.length - 2;
    } else {
      if (($r4 > GameData.Parts.Arms.length - 2)) {
        $r4 = 0;
      }
    }
    RootPartSwap(MC.arms, "Arms", String($r4));
  }
  if (!GameData.Characters[MC._name].Locks.Shoes) {
    !GameData.Characters[MC._name].Locks.Shoes;
    if (!(T == "Shoes")) {
      T == "Shoes";
    }
  }
  if ((T == "All")) {
    $r13 = GameData.Characters[MC._name].shoeFrame + N;
    if (($r13 < 0)) {
      $r13 = GameData.Parts.Shoes.length - 2;
    } else {
      if (($r4 > GameData.Parts.Shoes.length - 2)) {
        $r13 = 0;
      }
    }
    RootPartSwap(MC.legs, "Shoes", String($r13));
  }
  if (!GameData.Characters[MC._name].Locks.Body) {
    !GameData.Characters[MC._name].Locks.Body;
    if (!(T == "Body")) {
      T == "Body";
    }
  }
  if ((T == "All")) {
    $r6 = GameData.Characters[MC._name].bodyFrame + N;
    if (($r6 < 1)) {
      $r6 = GameData.Parts.Body.length - 2;
    } else {
      if (($r6 > GameData.Parts.Body.length - 2)) {
        $r6 = 1;
      }
    }
    RootPartSwap(MC.body, "Body", String($r6));
  }
  if (!GameData.Characters[MC._name].Locks.Items) {
    !GameData.Characters[MC._name].Locks.Items;
    if (!(T == "Items")) {
      T == "Items";
      if ((T == "All")) {
        T == "All";
      }
    }
  }
  if (!GameData.Settings.OldQS.Check) {
    $r9 = GameData.Characters[MC._name].itemFrame + N;
    if (($r9 < 0)) {
      $r9 = GameData.Parts.Items.length - 2;
    } else {
      if (($r9 > GameData.Parts.Items.length - 2)) {
        $r9 = 0;
      }
    }
    RootPartSwap(MC.item, "Items", String($r9));
  }
  if (!GameData.Characters[MC._name].Locks.Back) {
    !GameData.Characters[MC._name].Locks.Back;
    if (!(T == "Back")) {
      T == "Back";
      if ((T == "All")) {
        T == "All";
      }
    }
  }
  if (!GameData.Settings.OldQS.Check) {
    $r12 = GameData.Characters[MC._name].wingFrame + N;
    if (($r12 < 0)) {
      $r12 = GameData.Parts.Back.length - 2;
    } else {
      if (($r12 > GameData.Parts.Back.length - 2)) {
        $r12 = 0;
      }
    }
    RootPartSwap(MC.wings, "Back", String($r12));
  }
  if (!GameData.Characters[MC._name].Locks.Accessory) {
    !GameData.Characters[MC._name].Locks.Accessory;
    if (!(T == "Accessory")) {
      T == "Accessory";
      if ((T == "All")) {
        T == "All";
      }
    }
  }
  if (!GameData.Settings.OldQS.Check) {
    $r10 = GameData.Characters[MC._name].accFrame + N;
    if (($r10 < 0)) {
      $r10 = GameData.Parts.Acc.length - 2;
    } else {
      if (($r10 > GameData.Parts.Acc.length - 2)) {
        $r10 = 0;
      }
    }
    RootPartSwap(MC.accessory, "Acc", String($r10));
  }
}
function resetBoxingChen() {
  if (stage["Boxing Chen"].Target) {
    stage["Boxing Chen"]._xscale = 100;
    stage["Boxing Chen"]._yscale = 100;
    stage["Boxing Chen"].Target._rotation = stage["Boxing Chen"].TR;
    stage["Boxing Chen"].Target.eyes.gotoAndStop(GameData.Parts.Eyes[GameData.Characters[stage["Boxing Chen"].Target._name].eyeFrame][1]);
    if (GameData.Characters[stage["Boxing Chen"].Target._name].mouthFrame) {
      stage["Boxing Chen"].Target.mouth.gotoAndStop(GameData.Parts.Mouth[GameData.Characters[stage["Boxing Chen"].Target._name].mouthFrame][1]);
      stage["Boxing Chen"].Target.mouth._visible = true;
    } else {
      stage["Boxing Chen"].Target.mouth._visible = false;
    }
    stage["Boxing Chen"].Target = undefined;
  }
}
function openDNAInput() {
  OpenMenu(1, Interface.DNAMenu);
  Interface.DNAMenu.Title.text = "DNA Strand Input";
  Interface.DNAMenu.DNAdata.setNewTextFormat(GameData.TextFormats.Base);
  Interface.DNAMenu.DNAdata.text = "Enter DNA";
  Interface.DNAMenu.OK.bName.text = "Spawn";
  function () {
    SwapColor(MC.BG, "Buttons", 1);
    makeFromDNA(Interface.DNAMenu.DNAdata.text);
    CloseMenus(1);
  }
  <?>[Interface.DNAMenu.OK] = "onRelease";
}
function showDNAstrand(O) {
  OpenMenu(1, Interface.DNAMenu);
  Interface.DNAMenu.Title.text = "DNA Strand";
  Interface.DNAMenu.DNAdata.setNewTextFormat(GameData.TextFormats.Base);
  Interface.DNAMenu.DNAdata.text = getDNA(O);
  Interface.DNAMenu.OK.bName.text = "Close";
  function () {
    SwapColor(MC.BG, "Buttons", 1);
    CloseMenus(1);
  }
  <?>[Interface.DNAMenu.OK] = "onRelease";
}
function makeFromDNA(X) {
  if (GameData.Presets[X]) {
    $r1 = makeChar(X);
  } else {
    $r1 = makeChar("DNA-" + X);
  }
  injectCloneCapsule($r1);
}
function getDNA(O) {
  $r1 = GameData.Version + ":";
  $r1 = $r1 + (O.Name + ":");
  $r1 = $r1 + (O.Scale + ":");
  $r1 = $r1 + (O.hatFrame + ":");
  $r1 = $r1 + (O.headFrame + ":");
  $r1 = $r1 + (O.bodyFrame + ":");
  $r1 = $r1 + (O.armFrame + ":");
  $r1 = $r1 + (O.shoeFrame + ":");
  $r1 = $r1 + (O.eyeFrame + ":");
  $r1 = $r1 + (O.mouthFrame + ":");
  $r1 = $r1 + (O.itemFrame + ":");
  $r1 = $r1 + (O.accFrame + ":");
  $r1 = $r1 + (O.wingFrame + ":");
  $r1 = $r1 + O.HairColor.substr(2, 6);
  return $r1;
}
function injectCloneCapsule(MC) {
  playSound("Pop");
  GameData.Toys["Clone Capsule"].Char = GameData.Characters[MC._name];
  GameData.Toys["Clone Capsule"].Target = MC;
  setCharLook(stage["Clone Capsule"].char, GameData.Toys["Clone Capsule"].Char);
  stage["Clone Capsule"].char._visible = true;
  MC._visible = false;
  Target(stage["Clone Capsule"]);
}
function ejectCloneCapsule() {
  stage["Clone Capsule"].char._visible = false;
  Interface.TargetFrame.preview.toy.char._visible = false;
  GameData.Toys["Clone Capsule"].Target._visible = true;
  GameData.Toys["Clone Capsule"].Target._x = stage["Clone Capsule"]._x;
  GameData.Toys["Clone Capsule"].Target._y = stage["Clone Capsule"]._y;
  GameData.Toys["Clone Capsule"].Target.XMov = random(10) + 20;
  GameData.Toys["Clone Capsule"].Target.YMov = random(5) + 10;
}
function activateCloneCapsule() {
  if ((GameData.Toys["Clone Capsule"].Mode == 1)) {
    $r1 = makeChar("Capsule Clone");
    $r1.XMov = random(10) + 20;
    $r1.YMov = random(5) + 10;
    ColorPalette($r1.head2.HairColor, $r1.head.HairColor.RGB);
  } else {
    if ((GameData.Toys["Clone Capsule"].Mode == 2)) {
      c = 0;
      while ((c < 6)) {
        $r1 = makeChar("Capsule Clone");
        $r1.XMov = random(10) + 20;
        $r1.YMov = random(5) + 10;
        $r1._xscale = GameData.ScaleLimit;
        $r1._yscale = GameData.ScaleLimit;
        GameData.Characters[$r1._name].Scale = GameData.ScaleLimit;
        ColorPalette($r1.head2.HairColor, $r1.head.HairColor.RGB);
        c = c + 1;
      }
    } else {
      if ((GameData.Toys["Clone Capsule"].Mode == 3)) {
        ejectCloneCapsule();
        GameData.Toys["Clone Capsule"].Target._xscale = 100;
        GameData.Toys["Clone Capsule"].Target._yscale = 100;
        GameData.Characters[GameData.Toys["Clone Capsule"].Target._name].Scale = 100;
        Scramble(GameData.Toys["Clone Capsule"].Target);
        CloseMenus(1);
      } else {
        $r1 = makeChar("Capsule Clone");
        $r1.XMov = random(10) + 20;
        $r1.YMov = random(5) + 10;
        ColorPalette($r1.head2.HairColor, $r1.head.HairColor.RGB);
        Scramble($r1);
      }
    }
  }
}
function HaxSignBE() {
  stage["Grouchy Reimu"]._visible = false;
  _root.attachMovie("HaxSign", "HaxSign", 9999);
  GameData.Chat.Doom = 120;
  HaxSign.clock = 60;
  HaxSign._xscale = Stage.width * 100 / 550;
  HaxSign._yscale = Stage.height * 100 / 400;
  function () {
    if ((this.clock > 0)) {
      this.clock = this.clock - 1;
    } else {
      this.removeMovieClip();
    }
  }
  <?>[HaxSign] = "onEnterFrame";
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    c = $r0;
    if (stage[c]._visible) {
      stage[c]._visible;
    }
    if (!stage[c].Pin) {
      stage[c].Doom = random(100) + 100;
    }
  }
  Target();
}
function tinkerCloneCapsule() {
  GameData.Toys["Clone Capsule"].Mode = random(4) + 1;
  if ((GameData.Toys["Clone Capsule"].Mode == 4)) {
    stage["Clone Capsule"].lights.play();
    if (Interface.TargetFrame.preview.toy.lights) {
      Interface.TargetFrame.preview.toy.lights.play();
    }
  } else {
    stage["Clone Capsule"].lights.gotoAndStop(GameData.Toys["Clone Capsule"].Mode);
    if (Interface.TargetFrame.preview.toy.lights) {
      Interface.TargetFrame.preview.toy.lights.gotoAndStop(GameData.Toys["Clone Capsule"].Mode);
    }
  }
}
function ColorPalette(MC, Hexa) {
  $r1 = new Color(MC);
  $r1.setRGB(Hexa);
  MC.RGB = Hexa;
}
function Sys(msg, snd) {
  if (GameData.Settings.SysMessages.Check) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      S = $r0;
      SysConsole[S]._y = SysConsole[S]._y - 30;
    }
    SysConsole.attachMovie("SysMsg", "Sys" + GameData.SysID, GameData.SysID);
    SysConsole["Sys" + GameData.SysID].D.text = msg;
    SysConsole["Sys" + GameData.SysID].D.selectable = false;
    SysConsole["Sys" + GameData.SysID].CD = 50;
    GameData.SysID = GameData.SysID + 1;
    if (snd) {
      playSound(snd);
    }
  }
}
function setBGProperties() {
  bg._x = Number(Interface.BGMenu.lX.text);
  bg._y = Number(Interface.BGMenu.lY.text);
  bg._xscale = Number(Interface.BGMenu.sX.text);
  bg._yscale = Number(Interface.BGMenu.sX.text);
  bg._rotation = Number(Interface.BGMenu.rD.text);
  Dimmer._alpha = 100 - Number(Interface.BGMenu.Br.text);
  GameData.Friction = getFriction(Number(Interface.BGMenu.Fr.text));
}
function SwapBG(ID) {
  if (bg.fusionlab) {
    c = 1;
    while (!(c > 3)) {
      if (bg.fusionlab["fusion" + c].char._visible) {
        ejectFusionTank(c);
      }
      c = c + 1;
    }
  } else {
    if (bg.yuyuko) {
      StopYuyuko();
    }
  }
  if ((GameData.BGs[ID] == "none")) {
    bg._visible = false;
    GameData.BG = 0;
  } else {
    bg._visible = true;
    if ((GameData.BGs[ID] == "random")) {
      SwapBG(random(GameData.BGs.length));
    } else {
      bg.gotoAndStop(GameData.BGs[ID][1]);
      GameData.BG = ID;
    }
  }
  if (bg.nameBox1) {
    i = 0;
    while ((i < 5)) {
      bg["nameBox" + i].html = true;
      bg["nameBox" + i].htmlText = GameData.Imageboard.PostHeaders[i][0] + " <font color=\"#000000\" size=\"14\">" + GameData.Imageboard.PostHeaders[i][1] + "</font>";
      bg["hitBox" + i]._alpha = 0;
      bg["hitBox" + i].ID = i;
      function () {
        Interface.RenameMenu.ID = this.ID;
        Interface.RenameMenu.iName.text = GameData.Imageboard.PostHeaders[this.ID][0];
        $r2 = new TextFormat();
        $r2.font = "Arial";
        Interface.RenameMenu.iName.setTextFormat($r2);
        Selection.setFocus(Interface.RenameMenu.iName);
        Selection.setSelection(0, 0);
        function () {
          GameData.Imageboard.PostHeaders[this._parent.ID][0] = Interface.RenameMenu.iName.text;
          bg["nameBox" + this._parent.ID].htmlText = GameData.Imageboard.PostHeaders[this._parent.ID][0] + " <font color=\"#000000\" size=\"14\">" + GameData.Imageboard.PostHeaders[this._parent.ID][1] + "</font>";
          CloseMenus(1);
        }
        <?>[Interface.RenameMenu.OK] = "onRelease";
        OpenMenu(3, Interface.RenameMenu, this.BG);
      }
      <?>[bg["hitBox" + i]] = "onRelease";
      function () {
        GameData.KeyLock = true;
      }
      <?>[bg["tB" + i]] = "onSetFocus";
      function () {
        GameData.KeyLock = false;
      }
      <?>[bg["tB" + i]] = "onKillFocus";
      i = i + 1;
    }
  } else {
    if (bg.randomColor) {
      myColor = Math.round(Math.random() * 16777215);
      myColoredObject = new Color(bg.randomColor);
      myColoredObject.setRGB(myColor);
    } else {
      if (bg.yuyuko) {
        function () {
          if ((this.DB > 0)) {
            this.DB = this.DB - 1;
          }
        }
        <?>[bg.hitBox] = "onEnterFrame";
        function () {
          if ((this.DB > 0)) {
            if ((bg.yuyuko._currentframe == 1)) {
              bg.yuyuko.gotoAndStop(2);
            } else {
              StopYuyuko();
            }
            this.DB = 0;
          } else {
            this.DB = _root.GameData.DCrate;
          }
        }
        <?>[bg.hitBox] = "onRelease";
      }
    }
  }
}
function StopYuyuko() {
  bg.yuyuko.gotoAndStop(1);
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    c = $r0;
    if (GameData.Characters[c]) {
      setCharLook(stage[c], GameData.Characters[c]);
      stage[c]._xscale = GameData.Characters[c].Scale;
      stage[c]._yscale = GameData.Characters[c].Scale;
    }
  }
}
function injectFusionTank(N, T) {
  playSound("Pop");
  setCharLook(bg.fusionlab["fusion" + N].char, GameData.Characters[T._name]);
  bg.fusionlab["fusion" + N].char._visible = true;
  bg.fusionlab["fusion" + N].lights.gotoAndStop(1);
  fixFusionLights();
  bg.fusionlab["fusion" + N].Target = T;
  T._visible = false;
  Target();
}
function fixFusionLights() {
  if (bg.fusionlab.fusion1.char._visible) {
    bg.fusionlab.fusion1.char._visible;
  }
  if (bg.fusionlab.fusion2.char._visible) {
    bg.fusionlab.fusion3.lights.gotoAndStop(1);
  } else {
    if (!bg.fusionlab.fusion1.char._visible) {
      bg.fusionlab.fusion1.char._visible;
    }
    if (bg.fusionlab.fusion2.char._visible) {
      bg.fusionlab.fusion3.lights.gotoAndStop(2);
    } else {
      bg.fusionlab.fusion3.lights.gotoAndStop(3);
    }
  }
}
function activateFusion() {
  if (bg.fusionlab.fusion3.char._visible) {
    ejectFusionTank(3);
  } else {
    $r1 = GameData.Version + ":";
    $r3 = GameData.Characters[bg.fusionlab.fusion1.Target._name].Name;
    $r2 = GameData.Characters[bg.fusionlab.fusion2.Target._name].Name;
    n = 0;
    while ((n < GameData.Fusion.Names.length)) {
      if (($r3 == GameData.Fusion.Names[n][0])) {
        $r3 == GameData.Fusion.Names[n][0];
      }
      if (!($r2 == GameData.Fusion.Names[n][1])) {
        $r2 == GameData.Fusion.Names[n][1];
        if (($r2 == GameData.Fusion.Names[n][0])) {
          $r2 == GameData.Fusion.Names[n][0];
        }
      }
      if (($r3 == GameData.Fusion.Names[n][1])) {
        $r4 = GameData.Fusion.Names[n][2];
      } else {
        $r4 = $r3 + $r2;
      }
      n = n + 1;
    }
    $r1 = $r1 + ($r4 + ":");
    $r11 = Number(GameData.Characters[bg.fusionlab.fusion1.Target._name].Scale);
    $r9 = Number(GameData.Characters[bg.fusionlab.fusion2.Target._name].Scale);
    $r13 = ($r11 + $r9) / 2;
    $r1 = $r1 + ($r13 + ":");
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].hatFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].hatFrame + ":");
    }
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].headFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].headFrame + ":");
    }
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].bodyFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].bodyFrame + ":");
    }
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].armFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].armFrame + ":");
    }
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].shoeFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].shoeFrame + ":");
    }
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].eyeFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].eyeFrame + ":");
    }
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].mouthFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].mouthFrame + ":");
    }
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].itemFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].itemFrame + ":");
    }
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].accFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].accFrame + ":");
    }
    if (random(2)) {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion1.Target._name].wingFrame + ":");
    } else {
      $r1 = $r1 + (GameData.Characters[bg.fusionlab.fusion2.Target._name].wingFrame + ":");
    }
    $r7 = random(3);
    if (($r7 == 1)) {
      $r1 = $r1 + GameData.Characters[bg.fusionlab.fusion1.Target._name].HairColor.substr(2, 6);
    } else {
      if (($r7 == 2)) {
        $r1 = $r1 + GameData.Characters[bg.fusionlab.fusion2.Target._name].HairColor.substr(2, 6);
      } else {
        $r6 = GameData.Characters[bg.fusionlab.fusion1.Target._name].HairColor;
        $r5 = GameData.Characters[bg.fusionlab.fusion2.Target._name].HairColor;
        $r16 = toRGB($r6.charAt(2)) * 16 + toRGB($r6.charAt(3));
        $r20 = toRGB($r6.charAt(4)) * 16 + toRGB($r6.charAt(5));
        $r18 = toRGB($r6.charAt(6)) * 16 + toRGB($r6.charAt(7));
        $r14 = toRGB($r5.charAt(2)) * 16 + toRGB($r5.charAt(3));
        $r19 = toRGB($r5.charAt(4)) * 16 + toRGB($r5.charAt(5));
        $r17 = toRGB($r5.charAt(6)) * 16 + toRGB($r5.charAt(7));
        $r12 = Math.round(($r16 + $r14) / 2);
        $r10 = Math.round(($r20 + $r19) / 2);
        $r15 = Math.round(($r18 + $r17) / 2);
        $r1 = $r1 + getRGB($r12, $r10, $r15).substr(2, 6);
      }
    }
    $r8 = makeChar("DNA-" + $r1);
    injectFusionTank(3, $r8);
  }
}
function ejectFusionTank(N) {
  bg.fusionlab["fusion" + N].char._visible = false;
  bg.fusionlab["fusion" + N].lights.gotoAndStop(3);
  bg.fusionlab["fusion" + N].Target._visible = true;
  fixFusionLights();
  bg.fusionlab["fusion" + N].Target._x = bg.fusionlab["fusion" + N]._x;
  bg.fusionlab["fusion" + N].Target._y = bg.fusionlab["fusion" + N]._y;
  Scramble(bg.fusionlab["fusion" + N].Target);
}
function BoxingChenAttack() {
  $r5 = new Array();
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    c = $r0;
    $r1 = getDist(stage["Boxing Chen"], stage[c]._x, stage[c]._y);
    if (stage[c]._visible) {
      stage[c]._visible;
    }
    if (($r1 < GameData.Toys["Boxing Chen"].Range * (GameData.Characters[c].Scale / 100))) {
      $r5.push({Dist: $r1, ID: c});
    }
  }
  $r5.sortOn(["Dist", "ID"]);
  $r2 = stage[$r5[0].ID];
  if ($r2) {
    playSound("Boxing");
    stage["Boxing Chen"].Spin = 0;
    stage["Boxing Chen"].XMov = 0;
    stage["Boxing Chen"].YMov = 0;
    stage["Boxing Chen"].AttackRoll = 85;
    stage["Boxing Chen"].Target = $r2;
    stage["Boxing Chen"].TR = $r2._rotation;
    stage["Boxing Chen"]._x = $r2._x + 30 * Math.abs($r2._xscale) / 100;
    stage["Boxing Chen"]._y = $r2._y - 20 * Math.abs($r2._yscale) / 100;
    stage["Boxing Chen"]._xscale = Math.abs($r2._xscale);
    stage["Boxing Chen"]._yscale = Math.abs($r2._yscale);
    if (($r2._yscale < 0)) {
      $r2._rotation = 270;
    } else {
      $r2._rotation = 90;
    }
    $r2.eyes.gotoAndStop(8);
    $r2.mouth.gotoAndStop(27);
    $r2.mouth._visible = true;
    if ((stage["Boxing Chen"].getDepth() < $r2.getDepth())) {
      BringToFront(stage["Boxing Chen"]);
    }
  }
}
function setColorSliderRelease(MC) {
  function () {
    CSRhandler(this);
  }
  <?>[MC] = "onRelease";
  function () {
    CSRhandler(this);
  }
  <?>[MC] = "onReleaseOutside";
}
function CSRhandler(MC) {
  MC.stopDrag();
  delete MC.onEnterFrame;
}
function SwapPalette(MC) {
  $r4 = Math.round(MC.Rs._x);
  $r5 = Math.round(MC.Gs._x);
  $r3 = Math.round(MC.Bs._x);
  colorHex = getRGB($r4, $r5, $r3);
  ColorPalette(MC.Cp.BG, colorHex);
  if ((GameData.TargetType == "Character")) {
    GameData.Characters[GameData.Target._name].HairColor = colorHex;
    MC._parent.rgbcI.text = GameData.Characters[GameData.Target._name].HairColor.substr(2, 6);
    ColorPalette(GameData.Target.head.HairColor, colorHex);
    ColorPalette(Interface.TargetFrame.preview.char.hair.HairColor, colorHex);
    ColorPalette(GameData.Target.head2.HairColor, colorHex);
    ColorPalette(Interface.TargetFrame.preview.char.head2.HairColor, colorHex);
  } else {
    if ((GameData.TargetType == "SpeechBubble")) {
      GameData.SpeechBubbles[GameData.Target._name].FontColor = colorHex;
      MC._parent.rgbcI.text = GameData.SpeechBubbles[GameData.Target._name].FontColor.substr(2, 6);
      $r2 = new TextFormat();
      $r2.color = colorHex;
      GameData.Target.D.setTextFormat($r2);
      GameData.Target.D.setNewTextFormat($r2);
    }
  }
}
function pongStart() {
  _root.createEmptyMovieClip("game", 200);
  GameData.GameOn = true;
  function () {
    if ((TopDimmer._alpha < 100)) {
      TopDimmer._alpha = TopDimmer._alpha + 10;
      GameData.Target._rotation = GameData.Target._rotation + 30;
      GameData.Target._xscale = GameData.Target._xscale * 0.9;
      GameData.Target._yscale = GameData.Target._yscale * 0.9;
    } else {
      game.Paused = false;
      game.Score = 0;
      game.Graze = 0;
      game.ShowScore = 0;
      game.S = 0;
      game.B = 0;
      game.TimeBonus = 300;
      game.TimeBonusC = 30;
      game.Level = 1;
      game.Type = "Pong";
      GameData.Target._visible = false;
      ClickBlocker._visible = true;
      pongFixScale();
      if (GameData.StageCache) {
        _root.createEmptyMovieClip("stageShot", 55);
        screenShot(stageShot);
        stage._visible = false;
        bg._visible = false;
        Manipulator._visible = false;
      }
      game.attachMovie("BGBox", "TopBoundry", 1);
      game.TopBoundry._height = 10;
      game.TopBoundry._width = 510;
      game.TopBoundry._x = 20;
      game.TopBoundry._y = 30;
      game.TopBoundry._alpha = GameData.Buttons.Opacity;
      game.attachMovie("BGBox", "BottomBoundry", 2);
      game.BottomBoundry._height = 10;
      game.BottomBoundry._width = 510;
      game.BottomBoundry._x = 20;
      game.BottomBoundry._y = 360;
      game.BottomBoundry._alpha = GameData.Buttons.Opacity;
      game.attachMovie("ReimuBarrier", "bomb", 3);
      game.bomb._xscale = 160;
      game.bomb._yscale = 160;
      game.bomb._y = 190;
      game.bomb._visible = false;
      game.createEmptyMovieClip("bonus", 5);
      game.createEmptyMovieClip("shots", 99);
      game.attachMovie("Char", "Player", 10);
      game.Player.attachMovie("Focus", "hitbox", 10);
      game.Player.hitbox._visible = false;
      game.Player.Power = 0;
      game.Player.attachMovie("ReimuBarrier", "block", 20);
      game.Player.block._x = 50;
      game.Player.block._y = -60;
      game.Player.block._xscale = 110;
      game.Player.block._yscale = 110;
      game.Player.block._visible = false;
      setCharLook(game.Player, GameData.Characters[GameData.Target._name]);
      game.Player.eF = game.Player.eyes._currentframe;
      game.Player.mF = game.Player.mouth._currentframe;
      game.Player.mV = game.Player.mouth._visible;
      game.Player._x = -50;
      game.Player._y = 200;
      game.Player._xscale = 30;
      game.Player._yscale = 30;
      game.Player.Lives = 3;
      game.Player.NextLife = 1000;
      i = 0;
      while ((i < 4)) {
        game.attachMovie("Paddle", "Op" + i, i + 11);
        game["Op" + i]._xscale = 30;
        game["Op" + i]._yscale = 30;
        game["Op" + i]._visible = false;
        i = i + 1;
      }
      game.createEmptyMovieClip("Yukari", 20);
      makePresetChar(game.Yukari, "Yukari (IaMP)", "Chr", 20);
      game.Yukari.attachMovie("GapChar", "gap", 10);
      game.Yukari.gap._xscale = -100;
      game.Yukari.gap._x = 100;
      game.Yukari.gap._y = -300;
      game.Yukari.gap._rotation = 90;
      game.Yukari.gap.char._xscale = -100;
      game.Yukari.gap.char._x = 50;
      game.Yukari.gap.char._y = -30;
      game.Yukari.gap.char._rotation = 90;
      game.Yukari.gap.truck._visible = false;
      game.Yukari.gap._visible = false;
      game.Yukari._x = 600;
      game.Yukari._y = 200;
      game.Yukari._xscale = -30;
      game.Yukari._yscale = 30;
      game.Yukari.Speed = 4;
      game.Yukari.Life = 50;
      game.Yukari.MaxLife = 50;
      game.Yukari.GapC = 0;
      game.Yukari.ShotDelay = 100;
      game.Yukari.item._visible = false;
      game.createEmptyMovieClip("Ran", 30);
      makePresetChar(game.Ran, "Ran (2)", "Chr", 10);
      game.Ran.attachMovie("Focus", "hitbox", 20);
      game.Ran.hitbox._visible = false;
      game.Ran._x = 610;
      game.Ran._y = 295;
      game.Ran.Chr._y = 30;
      game.Ran._xscale = -30;
      game.Ran._yscale = 30;
      game.Ran.Speed = 10;
      game.createEmptyMovieClip("Chen", 31);
      makePresetChar(game.Chen, "Chen (2)", "Chr", 10);
      game.Chen.attachMovie("Focus", "hitbox", 20);
      game.Chen.hitbox._visible = false;
      game.Chen._x = 610;
      game.Chen._y = 295;
      game.Chen.Chr._y = 30;
      game.Chen._xscale = -30;
      game.Chen._yscale = 30;
      game.Chen.Speed = 7;
      game.Chen._visible = false;
      game.createEmptyMovieClip("Yuyuko", 32);
      makePresetChar(game.Yuyuko, "Yuyuko (2)", "Chr", 32);
      game.Yuyuko._x = 610;
      game.Yuyuko._y = 295;
      game.Yuyuko._xscale = -30;
      game.Yuyuko._yscale = 30;
      game.Yuyuko.Speed = 4;
      game.Yuyuko._visible = false;
      game.Yuyuko.Chr.wings._visible = false;
      game.Yuyuko.Chr.item._visible = false;
      game.createEmptyMovieClip("Youmu", 33);
      makePresetChar(game.Youmu, "Youmu (2)", "Chr", 10);
      game.Youmu.attachMovie("Focus", "hitbox", 20);
      game.Youmu.hitbox._visible = false;
      game.Youmu._x = 610;
      game.Youmu._y = 295;
      game.Youmu.Chr._y = 30;
      game.Youmu._xscale = -30;
      game.Youmu._yscale = 30;
      game.Youmu.Speed = 4;
      game.Youmu._visible = false;
      game.attachMovie("SpeechBubble", "Talky", 100);
      game.Talky.Bubble.gotoAndStop(1);
      game.Talky._visible = false;
      game.attachMovie("WhiteText", "note", 101);
      setFontSize(game.note.D, 12);
      game.note.D.text = "Press space to continue.\nPress ctrl to skip.";
      game.note.D._width = 200;
      game.note.D._height = 60;
      game.note._x = 40;
      game.note._y = 330;
      game.note._visible = false;
      game.createEmptyMovieClip("Interface", 102);
      game.Interface.attachMovie("WhiteText", "Stat1", 1);
      setFontSize(game.Interface.Stat1.D, 10);
      game.Interface.Stat1.D.text = "Life:\nPower:";
      game.Interface.Stat1.D._height = 60;
      game.Interface.Stat1.D._width = 200;
      game.Interface.Stat1._x = 11;
      game.Interface.Stat1._y = 375;
      l = 0;
      while ((l < 5)) {
        game.Interface.attachMovie("LifeStar", "Life" + l, 200 + l);
        game.Interface["Life" + l]._xscale = 15;
        game.Interface["Life" + l]._yscale = 15;
        game.Interface["Life" + l]._x = 48 + l * 15;
        game.Interface["Life" + l]._y = 379;
        if (!(l < game.Player.Lives)) {
          game.Interface["Life" + l]._visible = false;
        }
        l = l + 1;
      }
      game.Interface.attachMovie("WhiteText", "Stat2", 5);
      setFontSize(game.Interface.Stat2.D, 10);
      game.Interface.Stat2.D.text = "Graze:\nTimeBonus:";
      game.Interface.Stat2.D._height = 60;
      game.Interface.Stat2.D._width = 200;
      game.Interface.Stat2._x = 130;
      game.Interface.Stat2._y = 375;
      game.Interface.attachMovie("WhiteText", "Stat3", 6);
      setFontSize(game.Interface.Stat3.D, 10);
      game.Interface.Stat3.D.text = "Score:\nHi-Score:";
      game.Interface.Stat3.D._height = 60;
      game.Interface.Stat3.D._width = 200;
      game.Interface.Stat3._x = 235;
      game.Interface.Stat3._y = 375;
      game.Interface.attachMovie("WhiteText", "Power", 7);
      setFontSize(game.Interface.Power.D, 10);
      game.Interface.Power.D.text = "0.00/5.00";
      game.Interface.Power.D._height = 60;
      game.Interface.Power.D._width = 200;
      game.Interface.Power._x = 53;
      game.Interface.Power._y = 387;
      game.Interface.attachMovie("WhiteText", "YukariTag", 8);
      setFontSize(game.Interface.YukariTag.D, 10);
      game.Interface.YukariTag.D.text = "Yukari:";
      game.Interface.YukariTag.D._height = 60;
      game.Interface.YukariTag.D._width = 200;
      game.Interface.YukariTag._x = 13;
      game.Interface.YukariTag._y = 10;
      game.Interface.attachMovie("LifeBar", "YukariLife", 9);
      game.Interface.YukariLife._width = 0;
      game.Interface.YukariLife._x = 55;
      game.Interface.YukariLife._y = 8;
      game.Interface.attachMovie("WhiteText", "Score", 10);
      setFontSize(game.Interface.Score.D, 10);
      game.Interface.Score.D.text = "0";
      game.Interface.Score.D._height = 60;
      game.Interface.Score.D._width = 200;
      game.Interface.Score._x = 280;
      game.Interface.Score._y = 374;
      game.Interface.attachMovie("WhiteText", "HiScore", 11);
      setFontSize(game.Interface.HiScore.D, 10);
      game.Interface.HiScore.D.text = GameData.Pong.HiScore;
      game.Interface.HiScore.D._height = 60;
      game.Interface.HiScore.D._width = 200;
      game.Interface.HiScore._x = 289;
      game.Interface.HiScore._y = 387;
      game.Interface.attachMovie("WhiteText", "TimeBonus", 12);
      setFontSize(game.Interface.TimeBonus.D, 10);
      game.Interface.TimeBonus.D.text = game.TimeBonus;
      game.Interface.TimeBonus.D._height = 60;
      game.Interface.TimeBonus.D._width = 200;
      game.Interface.TimeBonus._x = 194;
      game.Interface.TimeBonus._y = 387;
      game.Interface.attachMovie("WhiteText", "Graze", 13);
      setFontSize(game.Interface.Graze.D, 10);
      game.Interface.Graze.D.text = 0;
      game.Interface.Graze.D._height = 60;
      game.Interface.Graze.D._width = 200;
      game.Interface.Graze._x = 168;
      game.Interface.Graze._y = 375;
      game.Interface.attachMovie("WhiteText", "Pause", 14);
      setFontSize(game.Interface.Pause.D, 10);
      game.Interface.Pause.D.text = "Paused";
      game.Interface.Pause.D._height = 60;
      game.Interface.Pause.D._width = 200;
      game.Interface.Pause._x = 249;
      game.Interface.Pause._y = 45;
      game.Interface.Pause._visible = false;
      game.Interface.attachMovie("WhiteText", "Info", 15);
      setFontSize(game.Interface.Info.D, 10);
      game.Interface.Info.D.text = "Up/Down Arrows to move.\nShift or Z to focus.\nX to bomb.\nP to pause.\nDon't let anyone past you!";
      game.Interface.Info.D._height = 60;
      game.Interface.Info.D._width = 200;
      game.Interface.Info._x = 48;
      game.Interface.Info._y = 260;
      game.Interface.Info._visible = false;
      game.createEmptyMovieClip("Exit", 200);
      game.Exit.attachMovie("Gap", "BG", 1);
      game.Exit.attachMovie("WhiteText", "D", 2);
      game.Exit.D.D.text = "Exit";
      game.Exit.BG._xscale = 25;
      game.Exit.BG._yscale = 25;
      game.Exit.BG._rotation = 90;
      game.Exit.BG._x = 75;
      game.Exit._x = 460;
      game.Exit._y = 370;
      function () {
        this.BG._x = 85;
        this.BG._y = -5;
        this.BG._xscale = 35;
        this.BG._yscale = 35;
      }
      <?>[game.Exit] = "onRollOver";
      function () {
        this.BG._x = 75;
        this.BG._y = 0;
        this.BG._xscale = 25;
        this.BG._yscale = 25;
      }
      <?>[game.Exit] = "onRollOut";
      function () {
        this._visible = false;
        game.Player._xscale = game.Player._xscale * -1;
        function () {
          game.Player._x = game.Player._x - 5;
          if ((TopDimmer._alpha < 100)) {
            TopDimmer._alpha = TopDimmer._alpha + 10;
          } else {
            pongExit();
          }
        }
        <?>[game] = "onEnterFrame";
      }
      <?>[game.Exit] = "onRelease";
      function () {
        function () {
          if ((TopDimmer._alpha > 0)) {
            TopDimmer._alpha = TopDimmer._alpha - 10;
          } else {
            pongStage(0);
          }
        }
        <?>[game] = "onEnterFrame";
      }
      <?>[this] = "onEnterFrame";
    }
  }
  <?>[game] = "onEnterFrame";
}
function pongSprayShot(A, S, N) {
  $r1 = S / N;
  $r5 = A - S / 2;
  s = 0;
  while ((s < N)) {
    pongSpawnShot(A + s * $r1);
    s = s + 1;
  }
}
function pongSpawnShot(A) {
  A = A - 90;
  game.shots.attachMovie("YukariShot", "Shot" + game.B, game.B);
  game.shots["Shot" + game.B]._rotation = A;
  game.shots["Shot" + game.B]._xscale = 40;
  game.shots["Shot" + game.B]._yscale = 40;
  game.shots["Shot" + game.B]._x = game.Yukari._x;
  game.shots["Shot" + game.B]._y = game.Yukari._y;
  $r1 = A * 3.141593 / 180;
  $r4 = 10 * Math.cos($r1);
  $r2 = 10 * Math.sin($r1);
  game.shots["Shot" + game.B].XMov = $r4;
  game.shots["Shot" + game.B].YMov = $r2;
  game.B = game.B + 1;
}
function setFontSize(MC, N) {
  $r1 = new TextFormat();
  $r1.size = N;
  MC.setNewTextFormat($r1);
}
function pongFixScale() {
  $r2 = Stage.width * 100 / 550;
  $r3 = Stage.height * 100 / 400;
  if (($r2 < $r3)) {
    $r1 = $r2;
  } else {
    $r1 = $r3;
  }
  game._xscale = $r1;
  game._yscale = $r1;
  game._x = (Stage.width - 550 * ($r1 / 100)) / 2;
}
function facialExpression(MC, E, M) {
  MC.Chr.eyes.gotoAndStop(E);
  if ((M == 0)) {
    MC.Chr.mouth._visible = false;
  } else {
    MC.Chr.mouth.gotoAndStop(M);
    MC.Chr.mouth._visible = true;
  }
}
function pongStage() {
  game.Talky._visible = false;
  if ((game.S == 0)) {
    function () {
      game.Player._x = game.Player._x + 2;
      game.Yukari._x = game.Yukari._x - 2;
      game.Ran._x = game.Ran._x - 2;
      if ((game.Player._x > 50)) {
        pongStage();
      }
    }
    <?>[game] = "onEnterFrame";
  } else {
    if ((game.S == 1)) {
      facialExpression(game.Yukari, 5, 1);
      popTalk(game.Talky, "So, you come into my domain to disturb my sleep! Now we must fight, one on one!", 352, 97, 100, 100, 0, -129.85, 0, 0, 5, 6, -96, 46, 0);
      game.note._visible = true;
      game.Interface.Info._visible = true;
      function () {
        pongController();
        pongNext();
      }
      <?>[game] = "onEnterFrame";
    } else {
      if ((game.S == 2)) {
        facialExpression(game.Ran, 2, 2);
        popTalk(game.Talky, "I fail to see how\nthis is one on one...", 402, 392, 100, 100, 0, -130, -91.35, 0, 3, -72, 68, 30, -178);
      } else {
        if ((game.S == 3)) {
          facialExpression(game.Ran, 1, 0);
          facialExpression(game.Yukari, 5, 2);
          popTalk(game.Talky, "Ran...", 417, 88, 100, 100, 0, -129.85, 0, 0, 1, 5, -37, 25, 0);
        } else {
          if ((game.S == 4)) {
            facialExpression(game.Yukari, 7, 9);
            popTalk(game.Talky, "SHUT UP!", 398, 68, 165, 165, 0, -129.85, 0, 0, 1, 5, -37, 25, 0);
          } else {
            if ((game.S == 5)) {
              game.note.removeMovieClip();
              game.Interface.Info.removeMovieClip();
              facialExpression(game.Yukari, 1, 1);
              function () {
                pongController();
                if ((this.Yukari._y < this.Ran._y)) {
                  this.Yukari._y = this.Yukari._y + 5;
                } else {
                  pongResetBall(this.Ran);
                  facialExpression(this.Ran, 29, 9);
                  function () {
                    pongMainLoop();
                  }
                  <?>[this] = "onEnterFrame";
                }
              }
              <?>[game] = "onEnterFrame";
            } else {
              if ((game.S == 6)) {
                facialExpression(game.Ran, 1, 0);
                facialExpression(game.Yukari, 5, 2);
                popTalk(game.Talky, "What is this?! Ran!\nWhy are we losing?!", 370, 230, 148, 148, 0, -129.85, -91.35, 0, 1.6, -78.4, -65, 31, 0);
                function () {
                  pongCutscene();
                  pongNext();
                }
                <?>[game] = "onEnterFrame";
              } else {
                if ((game.S == 7)) {
                  facialExpression(game.Ran, 1, 2);
                  facialExpression(game.Yukari, 5, 0);
                  popTalk(game.Talky, "Maybe if you did more\nthan just throw me\naround...", 343, 267, 100, 100, 0, -129.85, -91.35, 0, 1, -83, -76, 53, -14.635463);
                } else {
                  if ((game.S == 8)) {
                    facialExpression(game.Yukari, 5, 9);
                    facialExpression(game.Ran, 1, 0);
                    popTalk(game.Talky, "Shut up! I'm trying\nto think.", 363, 217, 109, 109, 0, -129.85, -91.35, 0, 5, -85, -59, 30, 0);
                  } else {
                    if ((game.S == 9)) {
                      facialExpression(game.Yukari, 5, 0);
                      facialExpression(game.Ran, 1, 2);
                      popTalk(game.Talky, "Okay... It's\njust...", 398, 297, 100, 100, 0, -129.85, -91.35, 0, 4, -82, -46, 32, 0);
                    } else {
                      if ((game.S == 10)) {
                        facialExpression(game.Yukari, 5, 14);
                        facialExpression(game.Ran, 7, 18);
                        popTalk(game.Talky, "Ran, SHUT UP!", 343, 254, 166, 166, 0, -129.85, -91.35, 0, 6, -85, -51, 20, 0);
                      } else {
                        if ((game.S == 11)) {
                          facialExpression(game.Yukari, 5, 0);
                          facialExpression(game.Ran, 22, 2);
                          popTalk(game.Talky, "But... you asked\nme a question.", 405, 399, 100, 100, 0, -129.85, -91.35, 0, 3, -71, 61, 27, 179.462322);
                        } else {
                          if ((game.S == 12)) {
                            facialExpression(game.Yukari, 12, 2);
                            facialExpression(game.Ran, 22, 0);
                            popTalk(game.Talky, "It was rhetorical!", 383, 209, 100, 100, 0, -129.85, -91.35, 0, 6, -84, -61, 27, 0.366323);
                          } else {
                            if ((game.S == 13)) {
                              facialExpression(game.Yukari, 12, 0);
                              facialExpression(game.Ran, 12, 2);
                              popTalk(game.Talky, "Alright already...\nsorry...", 395, 310, 100, 100, 0, -129.85, -91.35, 0, 6, -84, -59, 29, 0.366323);
                            } else {
                              if ((game.S == 14)) {
                                facialExpression(game.Yukari, 1, 1);
                                facialExpression(game.Ran, 1, 0);
                                popTalk(game.Talky, "Ran, I just came\nup with a brilliant\nidea!", 398, 197, 100, 100, 0, -129.85, -91.35, 0, 9, -77, -69, 41, 0.366323);
                              } else {
                                if ((game.S == 15)) {
                                  facialExpression(game.Ran, 1, 2);
                                  popTalk(game.Talky, "...What?", 418, 309, 100, 100, 0, -129.85, -91.35, 0, 6, -84, -32, 21, 0.366323);
                                } else {
                                  if ((game.S == 16)) {
                                    facialExpression(game.Ran, 1, 0);
                                    function () {
                                      pongController();
                                      if ((this.Yukari._y < this.Ran._y)) {
                                        this.Yukari._y = this.Yukari._y + 5;
                                      } else {
                                        pongStage();
                                      }
                                    }
                                    <?>[game] = "onEnterFrame";
                                  } else {
                                    if ((game.S == 17)) {
                                      facialExpression(game.Yukari, 7, 8);
                                      facialExpression(game.Ran, 29, 9);
                                      popTalk(game.Talky, "Missiles away!", 375, 329, 155, 155, 0, -129.85, -91.35, 0, 6, -84, -49, 14, 0.366323);
                                      function () {
                                        pongController();
                                        pongNext();
                                      }
                                      <?>[game] = "onEnterFrame";
                                    } else {
                                      if ((game.S == 18)) {
                                        pongNextLevel();
                                        function () {
                                          pongMainLoop();
                                        }
                                        <?>[game] = "onEnterFrame";
                                      } else {
                                        if ((game.S == 19)) {
                                          game.Yukari.GapC = 0;
                                          game.Yukari.gap._visible = false;
                                          facialExpression(game.Ran, 1, 0);
                                          facialExpression(game.Yukari, 5, 1);
                                          popTalk(game.Talky, "Looks like it's time\nfor me to use my secret\nweapon!", 370, 197, 100, 100, 0, -129.85, -91.35, 0, 8, -75, -79, 39, 0);
                                          function () {
                                            pongCutscene();
                                            pongNext();
                                          }
                                          <?>[game] = "onEnterFrame";
                                        } else {
                                          if ((game.S == 20)) {
                                            facialExpression(game.Ran, 1, 2);
                                            popTalk(game.Talky, "You have a secret\nweapon?", 383, 300, 100, 100, 0, -129.85, -91.35, 0, 8, -82, -61, 24, 0);
                                          } else {
                                            if ((game.S == 21)) {
                                              facialExpression(game.Yukari, 2, 2);
                                              facialExpression(game.Ran, 1, 0);
                                              popTalk(game.Talky, "Of course! You\nshould know what\nit is!", 390, 189, 100, 100, 0, -129.85, -91.35, 0, 6, -82, -63, 36, 0);
                                            } else {
                                              if ((game.S == 22)) {
                                                facialExpression(game.Yukari, 1, 1);
                                                function () {
                                                  pongController();
                                                  if ((this.Yukari._y < this.Ran._y)) {
                                                    this.Yukari._y = this.Yukari._y + 5;
                                                  } else {
                                                    pongStage();
                                                  }
                                                }
                                                <?>[game] = "onEnterFrame";
                                              } else {
                                                if ((game.S == 23)) {
                                                  facialExpression(game.Ran, 41, 2);
                                                  popTalk(game.Talky, "Umm...", 429, 396, 100, 100, 0, -129.85, -91.35, 0, 1, -79, 37, 21, -170.346176);
                                                  function () {
                                                    pongController();
                                                    pongNext();
                                                  }
                                                  <?>[game] = "onEnterFrame";
                                                } else {
                                                  if ((game.S == 24)) {
                                                    pongNextLevel();
                                                    pongYukariGap(game.Chen);
                                                    function () {
                                                      pongMainLoop();
                                                    }
                                                    <?>[game] = "onEnterFrame";
                                                  } else {
                                                    if ((game.S == 25)) {
                                                      game.Yukari.GapC = 0;
                                                      game.Yukari.gap._visible = false;
                                                      facialExpression(game.Yukari, 54, 14);
                                                      facialExpression(game.Ran, 1, 0);
                                                      popTalk(game.Talky, "What?! We lost again!\nRan! This is your fault\nsomehow!", 364, 209, 115, 115, 0, -129.85, -91.35, 0, 6, -80, -73, 30, 0);
                                                      function () {
                                                        pongCutscene();
                                                        pongNext();
                                                      }
                                                      <?>[game] = "onEnterFrame";
                                                    } else {
                                                      if ((game.S == 26)) {
                                                        facialExpression(game.Yukari, 54, 0);
                                                        facialExpression(game.Ran, 12, 2);
                                                        popTalk(game.Talky, "Maybe you would do\nbetter if you paid\nattention to chen.", 374, 289, 97, 97, 0, -129.85, -91.35, 0, 7.75, -73.9, -78, 35, 0);
                                                      } else {
                                                        if ((game.S == 27)) {
                                                          facialExpression(game.Yukari, 5, 2);
                                                          facialExpression(game.Ran, 1, 0);
                                                          popTalk(game.Talky, "I can't concentrate\non more than one thing\nran! I'm only human!", 373, 193, 97, 97, 0, -129.85, -91.35, 0, 7.75, -73.9, -78, 35, 0);
                                                        } else {
                                                          if ((game.S == 28)) {
                                                            facialExpression(game.Yukari, 5, 0);
                                                            facialExpression(game.Ran, 12, 2);
                                                            popTalk(game.Talky, "Actually, you're not\nhuman...", 373, 309, 97, 97, 0, -129.85, -91.35, 0, 7.75, -81.1, -75, 28, 0);
                                                          } else {
                                                            if ((game.S == 29)) {
                                                              facialExpression(game.Yukari, 1, 1);
                                                              facialExpression(game.Ran, 1, 0);
                                                              popTalk(game.Talky, "I know! I've thought\nup of another brilliant\nplan!", 402, 195, 97, 97, 0, -129.85, -91.35, 0, 7.75, -81.1, -80, 35, 0);
                                                            } else {
                                                              if ((game.S == 30)) {
                                                                facialExpression(game.Yukari, 1, 0);
                                                                pongYukariGap(game.Yuyuko);
                                                                function () {
                                                                  if ((game.Yukari.GapC > 0)) {
                                                                    game.Yukari.gap.char._x = game.Yukari.gap.char._x - 20;
                                                                    game.Yukari.GapC = game.Yukari.GapC - 1;
                                                                    if ((game.Yukari.GapC == 0)) {
                                                                      game.Yukari.gap._visible = false;
                                                                      game.Yukari.Target._x = game.Yukari._x - 50;
                                                                      game.Yukari.Target._y = game.Yukari._y;
                                                                      game.Yukari.Target._visible = true;
                                                                      facialExpression(game.Yuyuko, 33, 14);
                                                                      popTalk(game.Talky, "Where am I?!", 324, 248, 169, 169, 0, -129.85, -91.35, 0, 4.65, -88.3, -52, 20, 0);
                                                                      function () {
                                                                        pongCutscene();
                                                                        pongNext();
                                                                      }
                                                                      <?>[game] = "onEnterFrame";
                                                                    }
                                                                  }
                                                                }
                                                                <?>[game] = "onEnterFrame";
                                                              } else {
                                                                if ((game.S == 31)) {
                                                                  game.Yuyuko._xscale = 30;
                                                                  facialExpression(game.Yukari, 1, 1);
                                                                  facialExpression(game.Yuyuko, 1, 0);
                                                                  popTalk(game.Talky, "Yuyuko! Help me\nthrow chen at this\npest!", 433, 167, 100, 100, 0, -129.85, -91.35, 0, 8, -74, -60, 37, 0);
                                                                } else {
                                                                  if ((game.S == 32)) {
                                                                    facialExpression(game.Yukari, 1, 0);
                                                                    facialExpression(game.Yuyuko, 1, 1);
                                                                    popTalk(game.Talky, "K.", 359, 361, 314, 314, 0, -129.85, -91.35, 0, 3, -84, -18, 10, 0);
                                                                  } else {
                                                                    if ((game.S == 33)) {
                                                                      facialExpression(game.Yuyuko, 1, 0);
                                                                      facialExpression(game.Ran, 2, 2);
                                                                      popTalk(game.Talky, "I thought you wanted\na one on one fight.", 393, 295, 100, 100, 0, -129.85, -91.35, 0, 8, -84, -80, 35, 0);
                                                                    } else {
                                                                      if ((game.S == 34)) {
                                                                        facialExpression(game.Ran, 2, 0);
                                                                        facialExpression(game.Yukari, 2, 2);
                                                                        popTalk(game.Talky, "Ran...", 447, 102, 100, 100, 0, -129.85, 0, 0, 1, 5, -37, 25, 0);
                                                                      } else {
                                                                        if ((game.S == 35)) {
                                                                          facialExpression(game.Yukari, 2, 0);
                                                                          function () {
                                                                            pongController();
                                                                            if ((this.Yukari._y < this.Ran._y - 50)) {
                                                                              this.Yukari._y = this.Yukari._y + 5;
                                                                            } else {
                                                                              pongStage();
                                                                            }
                                                                          }
                                                                          <?>[game] = "onEnterFrame";
                                                                        } else {
                                                                          if ((game.S == 36)) {
                                                                            facialExpression(game.Ran, 7, 9);
                                                                            popTalk(game.Talky, "I know! I know!", 371, 322, 127, 127, 0, -129.85, -91.35, 0, 6, -89, -65, 25, 0);
                                                                            function () {
                                                                              pongController();
                                                                              pongNext();
                                                                            }
                                                                            <?>[game] = "onEnterFrame";
                                                                          } else {
                                                                            if ((game.S == 37)) {
                                                                              pongNextLevel();
                                                                              game.Yuyuko._xscale = -30;
                                                                              pongResetBall(game.Ran);
                                                                              pongResetBall(game.Chen);
                                                                              function () {
                                                                                pongMainLoop();
                                                                              }
                                                                              <?>[game] = "onEnterFrame";
                                                                            } else {
                                                                              if ((game.S == 38)) {
                                                                                game.Yukari.GapC = 0;
                                                                                game.Yukari.gap._visible = false;
                                                                                facialExpression(game.Ran, 2, 2);
                                                                                popTalk(game.Talky, "I think it's time to\ngive up...", 390, 302, 100, 100, 0, -129.85, -91.35, 0, 8, -83, -67, 38, 0);
                                                                                function () {
                                                                                  pongCutscene();
                                                                                  pongNext();
                                                                                }
                                                                                <?>[game] = "onEnterFrame";
                                                                              } else {
                                                                                if ((game.S == 39)) {
                                                                                  facialExpression(game.Ran, 2, 0);
                                                                                  facialExpression(game.Yuyuko, 1, 1);
                                                                                  popTalk(game.Talky, "I'm hungry.", 362, 204, 100, 100, 0, -129.85, -91.35, 0, 5, -83, -42, 19, 0);
                                                                                } else {
                                                                                  if ((game.S == 40)) {
                                                                                    facialExpression(game.Yuyuko, 1, 0);
                                                                                    facialExpression(game.Chen, 7, 13);
                                                                                    popTalk(game.Talky, "Nya.", 432, 113, 100, 100, 0, -129.85, -91.35, 0, 5, -83, -42, 19, 0);
                                                                                    playSound("Meow");
                                                                                  } else {
                                                                                    if ((game.S == 41)) {
                                                                                      game.Yuyuko._xscale = 30;
                                                                                      facialExpression(game.Chen, 7, 30);
                                                                                      facialExpression(game.Yukari, 5, 9);
                                                                                      popTalk(game.Talky, "Be quiet all of you!\nThere has to be a way\nto win!", 409, 168, 100, 100, 0, -129.85, -91.35, 0, 7, -76, -81, 34, 0);
                                                                                    } else {
                                                                                      if ((game.S == 42)) {
                                                                                        facialExpression(game.Yukari, 1, 0);
                                                                                        facialExpression(game.Yuyuko, 1, 1);
                                                                                        popTalk(game.Talky, "Maybe Youmu\ncould help.", 353, 195, 100, 100, 0, -129.85, -91.35, 0, 7, -79, -58, 24, 0);
                                                                                      } else {
                                                                                        if ((game.S == 43)) {
                                                                                          facialExpression(game.Yukari, 1, 1);
                                                                                          facialExpression(game.Yuyuko, 1, 0);
                                                                                          popTalk(game.Talky, "Good idea! Let\nme get her.", 418, 196, 100, 100, 0, -129.85, -91.35, 0, 7, -79, -58, 24, 0);
                                                                                        } else {
                                                                                          if ((game.S == 44)) {
                                                                                            facialExpression(game.Yukari, 1, 0);
                                                                                            pongYukariGap(game.Youmu);
                                                                                            function () {
                                                                                              if ((game.Yukari.GapC > 0)) {
                                                                                                game.Yukari.gap.char._x = game.Yukari.gap.char._x - 20;
                                                                                                game.Yukari.GapC = game.Yukari.GapC - 1;
                                                                                                if ((game.Yukari.GapC == 0)) {
                                                                                                  game.Yukari.gap._visible = false;
                                                                                                  game.Yukari.Target._x = game.Yukari._x - 50;
                                                                                                  game.Yukari.Target._y = game.Yukari._y;
                                                                                                  game.Yukari.Target._visible = true;
                                                                                                  facialExpression(game.Youmu, 33, 28);
                                                                                                  popTalk(game.Talky, "Huh? Where\nis this?", 350, 290, 100, 100, 0, -129.85, -91.35, 0, 7, -79, -58, 24, 0);
                                                                                                  function () {
                                                                                                    pongCutscene();
                                                                                                    pongNext();
                                                                                                  }
                                                                                                  <?>[game] = "onEnterFrame";
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                            <?>[game] = "onEnterFrame";
                                                                                          } else {
                                                                                            if ((game.S == 45)) {
                                                                                              facialExpression(game.Yuyuko, 1, 1);
                                                                                              facialExpression(game.Youmu, 1, 0);
                                                                                              popTalk(game.Talky, "We need your\nhelp taking down\nthis pest.", 357, 164, 100, 100, 0, -129.85, -91.35, 0, 7, -74, -64, 34, 0);
                                                                                            } else {
                                                                                              if ((game.S == 46)) {
                                                                                                facialExpression(game.Yuyuko, 1, 0);
                                                                                                facialExpression(game.Youmu, 1, 2);
                                                                                                popTalk(game.Talky, "Oh, ok.", 374, 289, 100, 100, 0, -129.85, -91.35, 0, 2, -84, -31, 25, 0);
                                                                                              } else {
                                                                                                if ((game.S == 47)) {
                                                                                                  pongNextLevel();
                                                                                                  facialExpression(game.Youmu, 5, 0);
                                                                                                  game.Yuyuko._xscale = -30;
                                                                                                  pongResetBall(game.Ran);
                                                                                                  pongResetBall(game.Chen);
                                                                                                  pongResetBall(game.Youmu);
                                                                                                  function () {
                                                                                                    pongMainLoop();
                                                                                                  }
                                                                                                  <?>[game] = "onEnterFrame";
                                                                                                } else {
                                                                                                  if ((game.S == 48)) {
                                                                                                    game.Yukari.GapC = 0;
                                                                                                    game.Yukari.gap._visible = false;
                                                                                                    facialExpression(game.Youmu, 1, 0);
                                                                                                    facialExpression(game.Yukari, 7, 14);
                                                                                                    popTalk(game.Talky, "That's it! Now I'm\nangry!", 420, 178, 100, 100, 0, -129.85, -91.35, 0, 8, -86, -58, 34, 0);
                                                                                                    function () {
                                                                                                      pongCutscene();
                                                                                                      pongNext();
                                                                                                    }
                                                                                                    <?>[game] = "onEnterFrame";
                                                                                                  } else {
                                                                                                    if ((game.S == 49)) {
                                                                                                      facialExpression(game.Yukari, 7, 0);
                                                                                                      facialExpression(game.Ran, 8, 28);
                                                                                                      popTalk(game.Talky, "Uh oh, looks like\nshe's finally getting\nserious now.", 425, 255, 100, 100, 0, -129.85, -91.35, 0, 6, -72, -69, 43, 0);
                                                                                                    } else {
                                                                                                      if ((game.S == 50)) {
                                                                                                        pongNextLevel();
                                                                                                        facialExpression(game.Yukari, 5, 0);
                                                                                                        facialExpression(game.Ran, 1, 0);
                                                                                                        pongResetBall(game.Ran);
                                                                                                        pongResetBall(game.Chen);
                                                                                                        pongResetBall(game.Youmu);
                                                                                                        function () {
                                                                                                          pongMainLoop();
                                                                                                        }
                                                                                                        <?>[game] = "onEnterFrame";
                                                                                                      } else {
                                                                                                        if ((game.S == 51)) {
                                                                                                          game.Yukari.GapC = 0;
                                                                                                          game.Yukari.gap._visible = false;
                                                                                                          facialExpression(game.Yukari, 7, 14);
                                                                                                          popTalk(game.Talky, "I've had enough\nof this!!", 394, 227, 188, 188, 0, -129.85, -91.35, 0, 3.8, -81.4, -53, 24, -1.36658);
                                                                                                          game.Wait = 50;
                                                                                                          function () {
                                                                                                            pongCutscene();
                                                                                                            if ((game.Wait > 0)) {
                                                                                                              game.Wait = game.Wait - 1;
                                                                                                            } else {
                                                                                                              game.attachMovie("GapChar", "GapTruck", 999);
                                                                                                              game.GapTruck.char._visible = false;
                                                                                                              game.GapTruck.truck._xscale = -100;
                                                                                                              game.GapTruck.truck._x = 850;
                                                                                                              game.GapTruck._x = 500;
                                                                                                              game.GapTruck._y = 230;
                                                                                                              game.GapTruck._xscale = 0;
                                                                                                              game.GapTruck._yscale = 0;
                                                                                                              game.GapTruck.S = false;
                                                                                                              function () {
                                                                                                                if ((game.GapTruck._xscale < 100)) {
                                                                                                                  game.GapTruck._xscale = game.GapTruck._xscale + 10;
                                                                                                                  game.GapTruck._yscale = game.GapTruck._yscale + 10;
                                                                                                                } else {
                                                                                                                  if (!game.GapTruck.S) {
                                                                                                                    playSound("Truck");
                                                                                                                    game.GapTruck.S = true;
                                                                                                                  }
                                                                                                                  game.GapTruck.truck._x = game.GapTruck.truck._x - 60;
                                                                                                                  if ((game.GapTruck.truck._x + game.GapTruck._x < game.Player._x + 600)) {
                                                                                                                    game.Player.eyes.gotoAndStop(9);
                                                                                                                    game.Player.mouth.gotoAndStop(14);
                                                                                                                    game.Player.mouth._visible = true;
                                                                                                                    function () {
                                                                                                                      if ((game.Player._xscale > 0)) {
                                                                                                                        if ((game.Player._xscale == 30)) {
                                                                                                                          playSound("Boxing");
                                                                                                                        }
                                                                                                                        game.Player._xscale = game.Player._xscale - 1;
                                                                                                                        game.Player._yscale = game.Player._yscale - 1;
                                                                                                                        game.Player._rotation = game.Player._rotation - 15;
                                                                                                                        game.Player._x = game.Player._x - 60;
                                                                                                                        game.Player._y = game.Player._y - 60;
                                                                                                                        game.GapTruck.truck._x = game.GapTruck.truck._x - 60;
                                                                                                                      } else {
                                                                                                                        game.GapTruck._visible = false;
                                                                                                                        game.Interface._visible = false;
                                                                                                                        game.TopBoundry._visible = false;
                                                                                                                        game.BottomBoundry._visible = false;
                                                                                                                        game.Yukari.gap._visible = false;
                                                                                                                        game.Yukari.wings._visible = false;
                                                                                                                        game.Yukari._xscale = -150;
                                                                                                                        game.Yukari._yscale = 150;
                                                                                                                        game.Yukari._x = 450;
                                                                                                                        game.Yukari._y = 450;
                                                                                                                        game.Yukari.eyes.gotoAndStop(12);
                                                                                                                        game.Yukari.mouth.gotoAndStop(27);
                                                                                                                        game.Yukari.mouth._visible = true;
                                                                                                                        game.Yuyuko._visible = false;
                                                                                                                        game.Ran._visible = false;
                                                                                                                        game.Chen._visible = false;
                                                                                                                        game.Youmu._visible = false;
                                                                                                                        game.shots._visible = false;
                                                                                                                        game.bonus._visible = false;
                                                                                                                        game.attachMovie("WhiteText", "GameOver", 43);
                                                                                                                        setFontSize(game.GameOver.D, 50);
                                                                                                                        game.GameOver.D.text = "You win!";
                                                                                                                        game.GameOver.D._height = 60;
                                                                                                                        game.GameOver.D._width = 500;
                                                                                                                        game.GameOver._x = 100;
                                                                                                                        game.GameOver._y = 30;
                                                                                                                        game.attachMovie("WhiteText", "GameOverStats", 44);
                                                                                                                        setFontSize(game.GameOverStats.D, 20);
                                                                                                                        game.GameOverStats.D.text = "Your Score:\nHi-Score:";
                                                                                                                        game.GameOverStats.D._height = 60;
                                                                                                                        game.GameOverStats.D._width = 500;
                                                                                                                        game.GameOverStats._x = 17;
                                                                                                                        game.GameOverStats._y = 253;
                                                                                                                        game.Exit._x = 50;
                                                                                                                        game.Exit._y = 330;
                                                                                                                        game.Exit._xscale = 200;
                                                                                                                        game.Exit._yscale = 200;
                                                                                                                        game.attachMovie("WhiteText", "YourScore", 45);
                                                                                                                        setFontSize(game.YourScore.D, 20);
                                                                                                                        game.YourScore.D.text = game.Score;
                                                                                                                        game.YourScore.D._height = 60;
                                                                                                                        game.YourScore.D._width = 500;
                                                                                                                        game.YourScore._x = 160;
                                                                                                                        game.YourScore._y = 251;
                                                                                                                        game.attachMovie("WhiteText", "HiScore", 46);
                                                                                                                        setFontSize(game.HiScore.D, 20);
                                                                                                                        game.HiScore.D.text = GameData.Pong.HiScore;
                                                                                                                        my_so.data.PongHiScore = GameData.Pong.HiScore;
                                                                                                                        my_so.flush();
                                                                                                                        game.HiScore.D._height = 60;
                                                                                                                        game.HiScore.D._width = 500;
                                                                                                                        game.HiScore._x = 120;
                                                                                                                        game.HiScore._y = 275;
                                                                                                                        game.attachMovie("WhiteText", "GameOver2", 47);
                                                                                                                        setFontSize(game.GameOver2.D, 20);
                                                                                                                        game.GameOver2.D.text = "I guess...";
                                                                                                                        game.GameOver2.D._height = 60;
                                                                                                                        game.GameOver2.D._width = 500;
                                                                                                                        game.GameOver2._x = 22;
                                                                                                                        game.GameOver2._y = 88;
                                                                                                                        game.attachMovie("WhiteText", "GameOver3", 48);
                                                                                                                        setFontSize(game.GameOver3.D, 14);
                                                                                                                        game.GameOver3.D.text = "Yukari cheated...";
                                                                                                                        game.GameOver3.D._height = 60;
                                                                                                                        game.GameOver3.D._width = 500;
                                                                                                                        game.GameOver3._x = 157;
                                                                                                                        game.GameOver3._y = 130;
                                                                                                                        popTalk(game.Talky, "Did not", 263, 298, 128, 128, 0, -129.85, -91.35, 0, 6, -85, -30, 19, 0);
                                                                                                                        delete game.onEnterFrame;
                                                                                                                      }
                                                                                                                    }
                                                                                                                    <?>[game] = "onEnterFrame";
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                              <?>[game] = "onEnterFrame";
                                                                                                            }
                                                                                                          }
                                                                                                          <?>[game] = "onEnterFrame";
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  game.S = game.S + 1;
}
function pongNextLevel() {
  game.Level = game.Level + 1;
  game.Yukari.MaxLife = game.Level * 50;
  game.Yukari.Life = game.Yukari.MaxLife;
  game.TimeBonus = game.Level * 300;
  game.Interface.TimeBonus.D.text = game.TimeBonus;
  pongResetBall(this.Ran);
}
function pongCutscene() {
  pongYukariLifeFix();
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    b = $r0;
    if ((getDist(game.bonus[b], game.Player._x, game.Player._y) < 30)) {
      playSound("ItemGet");
      if ((game.bonus[b].Type == "P1")) {
        game.bonus[b].removeMovieClip();
        pongGetPower(5);
      } else {
        if ((game.bonus[b].Type == "P2")) {
          game.bonus[b].removeMovieClip();
          pongGetPower(100);
        } else {
          game.bonus[b].removeMovieClip();
          pongAddScore(10);
        }
      }
    } else {
      game.bonus[b]._x = game.bonus[b]._x + (game.Player._x - game.bonus[b]._x) / 10;
      game.bonus[b]._y = game.bonus[b]._y + (game.Player._y - game.bonus[b]._y) / 10;
    }
  }
  game.Yukari._y = game.Yukari._y + (200 - game.Yukari._y) / 5;
  game.Ran._y = game.Ran._y + (300 - game.Ran._y) / 5;
  game.Ran._x = game.Ran._x + (500 - game.Ran._x) / 5;
  game.Ran._rotation = game.Ran._rotation + (0 - game.Ran._rotation) / 5;
  if (game.Chen._visible) {
    game.Chen._y = game.Chen._y + (100 - game.Chen._y) / 5;
    game.Chen._x = game.Chen._x + (500 - game.Chen._x) / 5;
    game.Chen._rotation = game.Chen._rotation + (0 - game.Chen._rotation) / 5;
  }
  if (game.Yuyuko._visible) {
    game.Yuyuko._y = game.Yuyuko._y + (200 - game.Yuyuko._y) / 5;
    game.Yuyuko._x = game.Yuyuko._x + (430 - game.Yuyuko._x) / 5;
  }
  if (game.Youmu._visible) {
    game.Youmu._y = game.Youmu._y + (290 - game.Youmu._y) / 5;
    game.Youmu._x = game.Youmu._x + (435 - game.Youmu._x) / 5;
    game.Youmu._rotation = game.Youmu._rotation + (0 - game.Youmu._rotation) / 5;
  }
  pongController();
}
function pongYukariGap(T) {
  mimeLook(T.Chr, game.Yukari.gap.char);
  game.Yukari.gap.char._x = 50;
  game.Yukari.gap._visible = true;
  T._visible = false;
  game.Yukari.Target = T;
  game.Yukari.GapC = 20;
}
function popTalk(MC, T, X, Y, Xs, Ys, R, tX, tY, tR, bX, bY, bXs, bYs, bR) {
  MC.D.text = T;
  MC.D._x = tX;
  MC.D._y = tY;
  MC.D._rotation = tR;
  MC.Bubble._x = bX;
  MC.Bubble._y = bY;
  MC.Bubble._xscale = bXs;
  MC.Bubble._yscale = bYs;
  MC.Bubble._rotation = bR;
  MC._x = X;
  MC._y = Y;
  MC._xscale = Xs;
  MC._yscale = Ys;
  MC._rotation = R;
  MC._visible = true;
  playSound("Pop");
}
function pongController() {
  if (!Key.isDown(16)) {
    Key.isDown(16);
  }
  if (Key.isDown(90)) {
    game.Player.hitbox._visible = true;
    if (!(game.Player.block._alpha < 20)) {
      game.Player.block._alpha < 20;
    }
    if (!game.Player.block._visible) {
      game.Player.block._visible = true;
      game.Player.block._alpha = 20;
    }
    game.Ran.hitbox._visible = true;
    game.Chen.hitbox._visible = true;
    game.Youmu.hitbox._visible = true;
    if (Key.isDown(38)) {
      pongMovePlayer(-4);
    } else {
      if (Key.isDown(40)) {
        pongMovePlayer(4);
      }
    }
  } else {
    game.Player.hitbox._visible = false;
    game.Ran.hitbox._visible = false;
    game.Chen.hitbox._visible = false;
    game.Youmu.hitbox._visible = false;
    if (Key.isDown(38)) {
      pongMovePlayer(-10);
    } else {
      if (Key.isDown(40)) {
        pongMovePlayer(10);
      }
    }
  }
  i = 0;
  while ((i < 4)) {
    if (game["Op" + i]._visible) {
      if (!Key.isDown(16)) {
        Key.isDown(16);
      }
      if (Key.isDown(90)) {
        game["Op" + i]._x = game["Op" + i]._x + (game.Player._x + game["Op" + i].fXMod - game["Op" + i]._x) / 3;
        game["Op" + i]._y = game["Op" + i]._y + (game.Player._y + game["Op" + i].fYMod - game["Op" + i]._y) / 3;
      } else {
        game["Op" + i]._x = game["Op" + i]._x + (game.Player._x + game["Op" + i].XMod - game["Op" + i]._x) / 5;
        game["Op" + i]._y = game["Op" + i]._y + (game.Player._y + game["Op" + i].YMod - game["Op" + i]._y) / 5;
      }
    }
    i = i + 1;
  }
  if (game.Player.block._visible) {
    if (!Key.isDown(16)) {
      Key.isDown(16);
    }
    if (Key.isDown(90)) {
      Key.isDown(90);
    }
    if (!(game.Player.block._alpha > 20)) {
      game.Player.block._alpha > 20;
      if (!Key.isDown(16)) {
        Key.isDown(16);
      }
    }
    if (!Key.isDown(90)) {
      game.Player.block._alpha = game.Player.block._alpha - 5;
      if (!(game.Player.block._alpha > 0)) {
        game.Player.block._visible = false;
      }
    }
  }
}
function pongMovePlayer(M) {
  if ((game.Player._y + M > GameData.Pong.Bottom)) {
    game.Player._y = GameData.Pong.Bottom;
  } else {
    if ((game.Player._y + M < GameData.Pong.Top)) {
      game.Player._y = GameData.Pong.Top;
    } else {
      game.Player._y = game.Player._y + M;
    }
  }
}
function pongNext() {
  if (Key.isDown(32)) {
    if (!GameData.Keys.Space) {
      pongStage();
      GameData.Keys.Space = true;
    }
  } else {
    GameData.Keys.Space = false;
  }
  if (Key.isDown(17)) {
    pongStage();
  }
}
function pongPaddleHit(MC, T) {
  if ((Math.abs(MC._x + MC.XMov - T._x) < 30)) {
    if ((MC._y < T._y + 30)) {
      MC._y < T._y + 30;
    }
    if ((MC._y > T._y - 70)) {
      return true;
    }
  }
  return false;
}
function pongBallMove(MC) {
  if ((MC.XMov < 0)) {
    $r2 = false;
    if (!(game.Player.Power < 100)) {
      i = 0;
      while ((i < 4)) {
        if (game["Op" + i]._visible) {
          game["Op" + i]._visible;
        }
        if (pongPaddleHit(MC, game["Op" + i])) {
          MC._x = game["Op" + i]._x - (MC.XMov - (MC._x - game["Op" + i]._x));
          MC.XMov = MC.XMov * -1;
          MC.YMov = MC.YMov + Math.floor((MC._y - (game["Op" + i]._y - 20)) / 10);
          MC.XMov = MC.XMov - 0.1;
          MC.Spin = MC.Spin - 0.1;
          $r2 = true;
        }
        i = i + 1;
      }
    }
    if (!$r2) {
      if (pongPaddleHit(MC, game.Player)) {
        if ((game.Player.hitStun > 0)) {
          game.Player.hitStun = 30;
          game.Player._rotation = game.Player._rotation - 5;
          MC.XMov = MC.XMov - 0.1;
          MC.Spin = MC.Spin - 0.1;
        } else {
          if (!Key.isDown(16)) {
            Key.isDown(16);
          }
          if (Key.isDown(90)) {
            game.Player.block._visible = true;
            game.Player.block._alpha = 100;
            MC.XMov = MC.XMov - 0.2;
            MC.Spin = MC.Spin - 0.2;
            pongSpawnBonus(700, game.Player._y, "P1");
          } else {
            game.Player.hitStun = 30;
            game.Player._rotation = -15;
            game.Player.eyes.gotoAndStop(7);
            game.Player.mouth.gotoAndStop(9);
            game.Player.mouth._visible = true;
            MC.XMov = MC.XMov - 0.1;
            MC.Spin = MC.Spin - 0.1;
          }
        }
        MC._x = game.Player._x - (MC.XMov - (MC._x - game.Player._x));
        MC.XMov = MC.XMov * -1;
        MC.YMov = MC.YMov + Math.floor((MC._y - (game.Player._y - 20)) / 10);
      } else {
        if ((MC._x < 50)) {
          MC._x < 50;
        }
        if ((game.bomb.Limit > 0)) {
          MC.XMov = MC.XMov * -1;
          MC.XMov = MC.XMov + 1;
          game.bomb.Limit = game.bomb.Limit - 25;
        } else {
          MC._x = MC._x + MC.XMov;
        }
      }
    }
  } else {
    if ((MC.XMov > 0)) {
      if (pongPaddleHit(MC, game.Yukari)) {
        MC._x = game.Yukari._x - (MC.XMov - (MC._x - game.Yukari._x));
        MC.XMov = MC.XMov * -1;
        MC.YMov = MC.YMov + Math.floor((MC._y - (game.Yukari._y - 20)) / 10);
        pongDamageYukari(1);
      } else {
        if (game.Yuyuko._visible) {
          game.Yuyuko._visible;
        }
        if (pongPaddleHit(MC, game.Yuyuko)) {
          MC._x = game.Yuyuko._x - (MC.XMov - (MC._x - game.Yuyuko._x));
          MC.XMov = MC.XMov * -1;
          MC.YMov = MC.YMov + Math.floor((MC._y - (game.Yuyuko._y - 20)) / 10);
        } else {
          MC._x = MC._x + MC.XMov;
        }
      }
    }
  }
  if ((MC._y + MC.YMov < GameData.Pong.Top)) {
    MC._y + MC.YMov < GameData.Pong.Top;
  }
  if ((MC.YMov < 0)) {
    MC._y = GameData.Pong.Top - (MC.YMov - (MC._y - GameData.Pong.Top));
    MC.YMov = MC.YMov * -1;
  } else {
    if ((MC._y + MC.YMov > GameData.Pong.Bottom)) {
      MC._y + MC.YMov > GameData.Pong.Bottom;
    }
    if ((MC.YMov > 0)) {
      MC._y = GameData.Pong.Bottom - (MC.YMov - (MC._y - GameData.Pong.Bottom));
      MC.YMov = MC.YMov * -1;
    } else {
      MC._y = MC._y + MC.YMov;
    }
  }
  MC._rotation = MC._rotation + MC.Spin;
  if ((MC._x < -100)) {
    MC._x < -100;
  }
  if ((game.Yukari.GapC == 0)) {
    pongYukariGap(MC);
    pongLoseLife();
  } else {
    if ((MC._x > 800)) {
      MC._x > 800;
    }
    if ((game.Yukari.GapC == 0)) {
      pongDamageYukari(10);
      pongSpawnBonus(MC._x + (random(21) - 10) * 5, MC._y + (random(21) - 10) * 5, "S");
      pongSpawnBonus(MC._x + (random(21) - 10) * 5, MC._y + (random(21) - 10) * 5, "S");
      if ((game.Yukari.Life < 1)) {
        pongSpawnBonus(MC._x + (random(21) - 10) * 5, MC._y + (random(21) - 10) * 5, "S");
        pongSpawnBonus(MC._x + (random(21) - 10) * 5, MC._y + (random(21) - 10) * 5, "S");
      } else {
        pongSpawnBonus(MC._x, MC._y, "P1");
        pongSpawnBonus(MC._x + (random(21) - 10) * 5, MC._y + (random(21) - 10) * 5, "P1");
        pongSpawnBonus(MC._x + (random(21) - 10) * 5, MC._y + (random(21) - 10) * 5, "P1");
        pongYukariGap(MC);
      }
    }
  }
}
function pongDamageYukari(D) {
  game.Yukari.Life = game.Yukari.Life - D * (game.Player.Power / 100 + 1);
  pongAddScore(D);
  if ((game.Yukari.Life < 1)) {
    pongAddScore(game.TimeBonus);
    game.Yukari.Life = 0;
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      s = $r0;
      pongSpawnBonus(game.shots[s]._x, game.shots[s]._y, "S");
      game.shots[s].removeMovieClip();
    }
    pongSpawnBonus(game.Yukari._x, game.Yukari._y, "P2");
    pongStage();
  }
}
function pongSpawnBonus(X, Y, T) {
  if (!(game.Player.Power == 500)) {
    game.Player.Power == 500;
  }
  if ((T == "S")) {
    game.bonus.attachMovie("PointItem", "BonusPoint" + game.B, game.B);
    game.bonus["BonusPoint" + game.B]._x = X;
    game.bonus["BonusPoint" + game.B]._y = Y;
    game.bonus["BonusPoint" + game.B].Speed = 5;
    game.bonus["BonusPoint" + game.B].XMov = -10;
    game.bonus["BonusPoint" + game.B].Type = "S";
    game.bonus["BonusPoint" + game.B]._xscale = 30;
    game.bonus["BonusPoint" + game.B]._yscale = 30;
  } else {
    game.bonus.attachMovie("Powerup", "PowerUp" + game.B, game.B);
    game.bonus["PowerUp" + game.B]._x = X;
    game.bonus["PowerUp" + game.B]._y = Y;
    game.bonus["PowerUp" + game.B].Speed = 5;
    game.bonus["PowerUp" + game.B].XMov = -10;
    game.bonus["PowerUp" + game.B].Type = T;
    if ((T == "P2")) {
      game.bonus["PowerUp" + game.B]._xscale = 50;
      game.bonus["PowerUp" + game.B]._yscale = 50;
    } else {
      game.bonus["PowerUp" + game.B]._xscale = 30;
      game.bonus["PowerUp" + game.B]._yscale = 30;
    }
  }
  game.B = game.B + 1;
}
function pongResetBall(T) {
  if ((T._name == "Ran")) {
    T.XMov = T.Speed * -1;
    if ((game.Yukari._y > game.Player._y)) {
      T.YMov = 1;
    } else {
      T.YMov = -1;
    }
    T.Spin = T.Speed * -1;
  } else {
    if ((T._name == "Chen")) {
      T.XMov = T.Speed * -1;
      if ((game.Yukari._y > game.Player._y)) {
        T.YMov = T.Speed;
      } else {
        T.YMov = T.Speed * -1;
      }
      T.Spin = T.Speed * -1;
    } else {
      if ((T._name == "Youmu")) {
        T.XMov = T.Speed * -1;
        T.YMov = 0;
        T.Spin = 0;
      }
    }
  }
  T._rotation = T.Spin;
  T.Mode = "Ball";
}
function pongShowPower() {
  trace(game.Player.Power);
  $r1 = game.Player.Power / 100;
  $r2 = String($r1);
  if (($r2.length == 3)) {
    game.Interface.Power.D.text = $r1 + "0/5.00";
  } else {
    if (($r2.length == 1)) {
      game.Interface.Power.D.text = $r1 + ".00/5.00";
    } else {
      game.Interface.Power.D.text = $r1 + "/5.00";
    }
  }
}
function pongGetPower(N) {
  if ((game.Player.Power < 500)) {
    if (!(game.Player.Power + N < 500)) {
      playSound("PowerUp");
      /*enumerate*/
      while (!(($r0 = <?>) == null)) {
        b = $r0;
        if (!(game.bonus[b].T == "S")) {
          pongSpawnBonus(game.bonus[b]._x, game.bonus[b]._y, "S");
          game.bonus[b].removeMovieClip();
        }
      }
      game.Player.Power = 500;
    } else {
      game.Player.Power = game.Player.Power + N;
    }
    pongShowPower();
    $r1 = Math.floor(game.Player.Power / 100 - 1);
    if (!($r1 < 0)) {
      !($r1 < 0);
    }
    if (($r1 < 4)) {
      $r1 < 4;
    }
    if (!game["Op" + $r1]._visible) {
      playSound("PowerUp");
      game["Op" + $r1]._x = game.Player._x;
      game["Op" + $r1]._y = game.Player._y;
      game["Op" + $r1]._visible = true;
      pongPaddleFormation($r1);
    }
  }
}
function pongPaddleFormation(N) {
  if ((N == 0)) {
    game.Op0.XMod = 50;
    game.Op0.YMod = 0;
    game.Op0.fXMod = 100;
    game.Op0.fYMod = 0;
  } else {
    if ((N == 1)) {
      game.Op0.XMod = 0;
      game.Op0.YMod = 50;
      game.Op0.fXMod = 50;
      game.Op0.fYMod = 35;
      game.Op1.XMod = 0;
      game.Op1.YMod = -100;
      game.Op1.fXMod = 50;
      game.Op1.fYMod = -50;
    } else {
      if ((N == 2)) {
        game.Op0.XMod = 0;
        game.Op0.YMod = 50;
        game.Op0.fXMod = 50;
        game.Op0.fYMod = 35;
        game.Op1.XMod = 0;
        game.Op1.YMod = -100;
        game.Op1.fXMod = 50;
        game.Op1.fYMod = -50;
        game.Op2.XMod = 50;
        game.Op2.YMod = 0;
        game.Op2.fXMod = 100;
        game.Op2.fYMod = 0;
      } else {
        if ((N == 3)) {
          game.Op0.XMod = 0;
          game.Op0.YMod = 50;
          game.Op0.fXMod = 50;
          game.Op0.fYMod = 35;
          game.Op1.XMod = 0;
          game.Op1.YMod = -100;
          game.Op1.fXMod = 50;
          game.Op1.fYMod = -50;
          game.Op2.XMod = 50;
          game.Op2.YMod = 35;
          game.Op2.fXMod = 0;
          game.Op2.fYMod = 200;
          game.Op3.XMod = 50;
          game.Op3.YMod = -50;
          game.Op3.fXMod = 0;
          game.Op3.fYMod = -250;
        }
      }
    }
  }
}
function pongLoseLife() {
  if (!game.bomb._visible) {
    pongSpawnBonus(700, game.Player._y + 30, "P1");
    pongSpawnBonus(700, game.Player._y - 30, "P1");
    playSound("Death");
    if ((game.Player.Lives == 0)) {
      game.Player.eyes.gotoAndStop(9);
      game.Player.mouth.gotoAndStop(14);
      game.Player.mouth._visible = true;
      function () {
        if ((game.Player._xscale > 0)) {
          game.Player._xscale = game.Player._xscale - 1;
          game.Player._yscale = game.Player._yscale - 1;
          game.Player._rotation = game.Player._rotation - 15;
        } else {
          game.Interface._visible = false;
          game.TopBoundry._visible = false;
          game.BottomBoundry._visible = false;
          game.Yukari.gap._visible = false;
          game.Yukari.wings._visible = false;
          game.Yukari._xscale = -150;
          game.Yukari._yscale = 150;
          game.Yukari._x = 450;
          game.Yukari._y = 450;
          game.Yukari.eyes.gotoAndStop(1);
          game.Yukari.mouth.gotoAndStop(1);
          game.Yukari.mouth._visible = true;
          game.Yuyuko._visible = false;
          game.Ran._visible = false;
          game.Chen._visible = false;
          game.Youmu._visible = false;
          game.shots._visible = false;
          game.bonus._visible = false;
          game.attachMovie("WhiteText", "GameOver", 43);
          setFontSize(game.GameOver.D, 50);
          game.GameOver.D.text = "Game Over";
          game.GameOver.D._height = 60;
          game.GameOver.D._width = 500;
          game.GameOver._x = 100;
          game.GameOver._y = 30;
          game.attachMovie("WhiteText", "GameOverStats", 44);
          setFontSize(game.GameOverStats.D, 20);
          game.GameOverStats.D.text = "Your Score:\nHi-Score:";
          game.GameOverStats.D._height = 60;
          game.GameOverStats.D._width = 500;
          game.GameOverStats._x = 17;
          game.GameOverStats._y = 253;
          game.Exit._x = 50;
          game.Exit._y = 330;
          game.Exit._xscale = 200;
          game.Exit._yscale = 200;
          game.attachMovie("WhiteText", "YourScore", 45);
          setFontSize(game.YourScore.D, 20);
          game.YourScore.D.text = game.Score;
          game.YourScore.D._height = 60;
          game.YourScore.D._width = 500;
          game.YourScore._x = 160;
          game.YourScore._y = 251;
          game.attachMovie("WhiteText", "HiScore", 46);
          setFontSize(game.HiScore.D, 20);
          game.HiScore.D.text = GameData.Pong.HiScore;
          my_so.data.PongHiScore = GameData.Pong.HiScore;
          my_so.flush();
          game.HiScore.D._height = 60;
          game.HiScore.D._width = 500;
          game.HiScore._x = 120;
          game.HiScore._y = 275;
          popTalk(game.Talky, "Bow before me\nweakling!", 258, 250, 118, 118, 0, -129.85, -91.35, 0, 5, -84, -56, 35, 0);
          delete game.onEnterFrame;
        }
      }
      <?>[game] = "onEnterFrame";
    } else {
      game.Player.Lives = game.Player.Lives - 1;
      game.Interface["Life" + game.Player.Lives]._visible = false;
      game.bomb._alpha = 100;
      game.bomb._visible = true;
      game.bomb.Limit = 100;
    }
  }
}
function pongMainLoop() {
  if (Key.isDown(80)) {
    if (!GameData.Keys.P) {
      if (game.Paused) {
        game.Paused = false;
        game.Interface.Pause._visible = false;
      } else {
        game.Paused = true;
        game.Interface.Pause._visible = true;
      }
      GameData.Keys.P = true;
    }
  } else {
    GameData.Keys.P = false;
  }
  if ((game.ShowScore < game.Score)) {
    if ((game.Score - game.ShowScore > 100)) {
      game.ShowScore = game.ShowScore + 10;
    } else {
      game.ShowScore = game.ShowScore + 1;
    }
    if ((game.ShowScore > game.Player.NextLife)) {
      if ((game.Player.Lives < 5)) {
        playSound("PowerUp");
        game.Interface["Life" + game.Player.Lives]._visible = true;
        game.Player.Lives = game.Player.Lives + 1;
      }
      game.Player.NextLife = game.Player.NextLife + 1000;
    }
    game.Interface.Score.D.text = game.ShowScore;
    if ((game.ShowScore > Number(game.Interface.HiScore.D.text))) {
      game.Interface.HiScore.D.text = game.ShowScore;
    }
  }
  if (!game.Paused) {
    pongYukariLifeFix();
    if ((game.TimeBonus > 0)) {
      if ((game.TimeBonusC > 0)) {
        game.TimeBonusC = game.TimeBonusC - 1;
      } else {
        game.TimeBonus = game.TimeBonus - 1;
        game.TimeBonusC = 30;
        game.Interface.TimeBonus.D.text = game.TimeBonus;
      }
    }
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      s = $r0;
      game.shots[s]._x = game.shots[s]._x + game.shots[s].XMov;
      game.shots[s]._y = game.shots[s]._y + game.shots[s].YMov;
      if ((game.shots[s]._x < -300)) {
        game.shots[s].removeMovieClip();
      } else {
        if ((getDist(game.shots[s], game.Player._x, game.Player._y) < 6)) {
          pongLoseLife();
          game.shots[s].removeMovieClip();
        } else {
          if ((getDist(game.shots[s], game.Player._x, game.Player._y) < 20)) {
            game.shots[s].Graze = true;
          } else {
            if (game.shots[s].Graze) {
              pongSpawnBonus(700, game.Player._y, "P1");
              playSound("Graze");
              game.Graze = game.Graze + 1;
              game.Interface.Graze.D.text = game.Graze;
              game.shots[s].Graze = false;
            }
          }
        }
      }
    }
    if (Key.isDown(192)) {
      Key.isDown(192);
    }
    if (GameData.DevMode) {
      if (!GameData.Keys.Dev) {
        pongDamageYukari(game.Yukari.Life);
        pongSpawnBonus(game.Player._x + 100, game.Player._y, "P2");
        GameData.Keys.Dev = true;
      }
    } else {
      GameData.Keys.Dev = false;
    }
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      b = $r0;
      if ((game.bonus[b]._x < -300)) {
        game.bonus[b].removeMovieClip();
      } else {
        if ((getDist(game.bonus[b], game.Player._x, game.Player._y) < 30)) {
          playSound("ItemGet");
          if ((game.bonus[b].Type == "P1")) {
            game.bonus[b].removeMovieClip();
            pongGetPower(5);
          } else {
            if ((game.bonus[b].Type == "P2")) {
              game.bonus[b].removeMovieClip();
              pongGetPower(100);
            } else {
              game.bonus[b].removeMovieClip();
              pongAddScore(10);
            }
          }
        } else {
          if ((getDist(game.bonus[b], game.Player._x, game.Player._y) < 60)) {
            game.bonus[b]._x = game.bonus[b]._x + (game.Player._x - game.bonus[b]._x) / 10;
            game.bonus[b]._y = game.bonus[b]._y + (game.Player._y - game.bonus[b]._y) / 10;
          } else {
            if ((game.bonus[b].XMov < game.bonus[b].Speed)) {
              game.bonus[b].XMov = game.bonus[b].XMov + 1;
            }
            game.bonus[b]._x = game.bonus[b]._x - game.bonus[b].XMov;
          }
        }
      }
    }
    if ((game.bomb.Limit > 0)) {
      game.bomb.Limit = game.bomb.Limit - 1;
    } else {
      if (game.bomb._visible) {
        game.bomb._alpha = game.bomb._alpha - 5;
        if ((game.bomb._alpha < 0)) {
          game.bomb._visible = false;
        }
      } else {
        if (Key.isDown(88)) {
          Key.isDown(88);
        }
        if (!(game.Player.Power < 100)) {
          pongBomb();
        }
      }
    }
    if ((game.Player.hitStun > 0)) {
      game.Player.hitStun = game.Player.hitStun - 1;
      if ((game.Player.hitStun == 0)) {
        game.Player._rotation = 0;
        game.Player.eyes.gotoAndStop(game.Player.eF);
        game.Player.mouth.gotoAndStop(game.Player.mF);
        game.Player.mouth._visible = game.Player.mV;
      }
    } else {
      pongController();
    }
    if ((game.Ran.Mode == "Ball")) {
      pongBallMove(game.Ran);
    }
    if ((game.Chen.Mode == "Ball")) {
      pongBallMove(game.Chen);
    }
    if ((game.Youmu.Mode == "Ball")) {
      if ((game.Youmu._x > 225)) {
        game.Youmu._x > 225;
      }
      if ((game.Youmu.XMov > 0)) {
        game.Youmu.XMov = Math.floor(game.Youmu.XMov * 0.9);
      } else {
        game.Youmu.XMov = game.Youmu.XMov - 1;
      }
      pongBallMove(game.Youmu);
      game.Youmu._rotation = game.Youmu.XMov;
    }
    pongYukariAI();
    if (game.Yuyuko._visible) {
      pongYuyukoAI();
    }
  }
}
function pongAddScore(N) {
  game.Score = game.Score + N;
  if ((game.Score > GameData.Pong.HiScore)) {
    GameData.Pong.HiScore = game.Score;
  }
}
function pongYukariLifeFix() {
  $r1 = 480 * (game.Yukari.Life / game.Yukari.MaxLife);
  game.Interface.YukariLife._width = game.Interface.YukariLife._width + ($r1 - game.Interface.YukariLife._width) / 10;
}
function pongBomb() {
  game.Player.Power = game.Player.Power - 100;
  pongShowPower();
  $r1 = Math.floor(game.Player.Power / 100);
  if (game["Op" + $r1]._visible) {
    game["Op" + $r1]._visible = false;
  }
  pongPaddleFormation($r1 - 1);
  game.bomb._alpha = 100;
  game.bomb._visible = true;
  game.bomb.Limit = 120;
}
function pongYukariAI() {
  if ((game.Level > 1)) {
    if ((game.Yukari.ShotDelay > 0)) {
      game.Yukari.ShotDelay = game.Yukari.ShotDelay - 1;
      if ((game.Level > 5)) {
        if ((game.Yukari.ShotDelay == 50)) {
          pongSprayShot(getAngle(game.Yukari._x, game.Yukari._y, game.Player._x, game.Player._y), 25, game.Level + 2);
        }
      }
    } else {
      pongSprayShot(getAngle(game.Yukari._x, game.Yukari._y, game.Player._x, game.Player._y), 30, game.Level + 1);
      game.Yukari.ShotDelay = 100;
    }
  }
  if ((game.Yukari.GapC > 0)) {
    game.Yukari.gap.char._x = game.Yukari.gap.char._x - 20;
    game.Yukari.GapC = game.Yukari.GapC - 1;
    if ((game.Yukari.GapC == 0)) {
      game.Yukari.gap._visible = false;
      game.Yukari.Target._x = game.Yukari._x - 50;
      game.Yukari.Target._y = game.Yukari._y;
      game.Yukari.Target._visible = true;
      pongResetBall(game.Yukari.Target);
    }
  }
  if ((game.Yukari._y < game.Ran._y)) {
    if ((game.Yukari._y + game.Yukari.Speed > game.Ran._y)) {
      game.Yukari._y = game.Ran._y;
    } else {
      game.Yukari._y = game.Yukari._y + game.Yukari.Speed;
    }
  } else {
    if ((game.Yukari._y > game.Ran._y)) {
      if ((game.Yukari._y - game.Yukari.Speed < game.Ran._y)) {
        game.Yukari._y = game.Ran._y;
      } else {
        game.Yukari._y = game.Yukari._y - game.Yukari.Speed;
      }
    }
  }
}
function pongYuyukoAI() {
  game.Yuyuko._x = game.Yuyuko._x + (500 - game.Yuyuko._x) / 5;
  if ((game.Yuyuko._y < game.Chen._y)) {
    if ((game.Yuyuko._y + game.Yuyuko.Speed > game.Chen._y)) {
      game.Yuyuko._y = game.Chen._y;
    } else {
      game.Yuyuko._y = game.Yuyuko._y + game.Yuyuko.Speed;
    }
  } else {
    if ((game.Yuyuko._y > game.Chen._y)) {
      if ((game.Yuyuko._y - game.Yuyuko.Speed < game.Chen._y)) {
        game.Yuyuko._y = game.Chen._y;
      } else {
        game.Yuyuko._y = game.Yuyuko._y - game.Yuyuko.Speed;
      }
    }
  }
  if ((game.Yuyuko._y > game.Yukari._y)) {
    game.Yuyuko._y > game.Yukari._y;
  }
  if ((game.Yuyuko.getDepth() < game.Yukari.getDepth())) {
    game.Yuyuko.swapDepths(game.Yukari);
  } else {
    if ((game.Yuyuko._y < game.Yukari._y)) {
      game.Yuyuko._y < game.Yukari._y;
    }
    if ((game.Yuyuko.getDepth() > game.Yukari.getDepth())) {
      game.Yuyuko.swapDepths(game.Yukari);
    }
  }
}
function pongExit() {
  if (GameData.StageCache) {
    stageShot.removeMovieClip();
    stage._visible = true;
    if (!(GameData.BG == 0)) {
      bg._visible = true;
    }
  }
  GameData.Target._xscale = GameData.Characters[GameData.Target._name].Scale * GameData.Target.XFace;
  GameData.Target._yscale = GameData.Characters[GameData.Target._name].Scale * GameData.Target.YFace;
  GameData.Target._visible = true;
  Scramble(GameData.Target);
  GameData.GameOn = false;
  game._visible = false;
  ClickBlocker._visible = false;
  function () {
    if ((TopDimmer._alpha > 0)) {
      TopDimmer._alpha = TopDimmer._alpha - 10;
    } else {
      this.removeMovieClip();
    }
  }
  <?>[game] = "onEnterFrame";
}
GameData = new Object();
var my_so = SharedObject.getLocal("walfas_create_savedata", "/");
GameData.Pong = new Object();
GameData.Depths = new Object();
GameData.Menus = new Object();
GameData.Menus.Functions = new Object();
GameData.Menus.OnLoad = new Object();
GameData.Menus.OnSetFocus = new Object();
GameData.Keys = new Object();
GameData.Keys.Functions = new Object();
GameData.Windows = new Object();
GameData.BGFunctions = new Object();
GameData.Version = 3.39;
GameData.DevMode = true;
GameData.Action = "";
GameData.Target = "";
GameData.Friction = 0.9;
GameData.ScaleLimit = 10;
GameData.DCrate = 15;
GameData.SysID = 0;
GameData.CharID = 0;
GameData.LogicID = 0;
GameData.ObjID = 0;
GameData.BubbleID = 0;
GameData.SSID = 0;
GameData.ClusterID = 0;
GameData.RainID = 0;
GameData.BG = 0;
GameData.BGAnim = 1;
GameData.DLSelect = 0;
GameData.MSRate = 10;
GameData.GameOn = false;
GameData.ShowManipulator = false;
GameData.ShowManipulatorMenu = true;
GameData.BGAutoScale = true;
GameData.StageCache = true;
GameData.Hotkeys = new Array();
GameData.Settings = new Object();
newSetting("SysMessages", true, "Show System Messages");
newSetting("RandomBubbles", false, "Spawn Random Bubble Text");
newSetting("PinnedLoading", true, "Pinned Scene Loading");
newSetting("TheaterMode", true, "Theater Mode");
newSetting("AutoScrollMenu", false, "Auto-Scroll Menus");
newSetting("UntargetablePinned", false, "Untargetable Pinned");
newSetting("KeylockPinned", false, "Keylock Pinned");
newSetting("SwitchArrows", false, "Switch Ctrl/Shift Arrows");
newSetting("HeadRotates", true, "Head Rotates Characters");
newSetting("KeepColor", false, "Keep Colors");
newSetting("OldQS", true, "Old Quick Change");
newSetting("MassLocking", false, "Mass Character Locks");
newSetting("PresetWithItems", true, "Spawn Presets with Items");
newSetting("Mute", false, "Mute All Sounds");
newSetting("ClickStopsSpin", true, "Click Stops Spin");
newSetting("ASpeed", false, "Arrow Speed", 1);
newSetting("DefaultChar", false, "Default Character", "Meiling");
GameData.Characters = new Object();
GameData.SpeechBubbles = new Object();
GameData.Objects = new Object();
GameData.Screenshots = new Object();
GameData.Clusters = new Object();
GameData.Rain = new Object();
GameData.Logics = new Object();
GameData.Images = new Object();
GameData.Presets = new Object();
GameData.Pong.HiScore = 0;
GameData.Depths.Max = 0;
GameData.Depths.StageList = new Array();
GameData.CurrentScene = new Object();
GameData.CurrentScene.Name = "untitled";
GameData.CurrentScene.Prev = "";
GameData.CurrentScene.Next = "";
GameData.CurrentScene.ClearStage = true;
GameData.CurrentScene.CurrentAct = 0;
GameData.SceneActs = new Array();
GameData.Buttons = new Object();
GameData.Buttons.Opacity = 85;
GameData.Locks = new Object();
GameData.Locks.Mouth = false;
GameData.Locks.Eyes = false;
GameData.Locks.Hair = false;
GameData.Locks.Body = false;
GameData.Locks.Arms = false;
GameData.Locks.Shoes = false;
GameData.Locks.Back = false;
GameData.Locks.Accessory = false;
GameData.Locks.Items = false;
GameData.Locks.Hats = false;
GameData.Chat = new Object();
GameData.Chat.Active = true;
GameData.Chat.D = 0;
GameData.Chat.L = 0;
GameData.Chat.Delay = 15;
GameData.Chat.Doom = 0;
GameData.Chat.Users = new Object();
GameData.Chat.Users.LOLSpark = new Array();
GameData.Chat.Users.LOLSpark.push("Hey Reimu!");
GameData.Chat.Users.LOLSpark.push("Hey Reimu!!");
GameData.Chat.Users.LOLSpark.push("Hey Reimu!!!!");
GameData.Chat.Users.LOLSpark.push("Reimu!!");
GameData.Chat.Users.LOLSpark.push("Reimuuuuu!!");
GameData.Chat.Users.LOLSpark.push("Raymoooooo!!");
GameData.Chat.Users.LOLSpark.push("Reimu Reimu Reimu");
GameData.Chat.Users.LOLSpark.push("Reimu!! Are you there???");
GameData.Chat.Users.WakiMiko = new Array();
GameData.Chat.Users.WakiMiko.push("stop it please");
GameData.Chat.Users.WakiMiko.push("STOOOOOOOOOOP");
GameData.Chat.Users.WakiMiko.push("SHUT THE HELL UP ALREADY");
GameData.Chat.Users.Cirno9 = new Array();
GameData.Chat.Users.Cirno9.push("Hooray!");
GameData.Chat.Users.Cirno9.push("I AM A GENIUS");
GameData.Chat.Users.Cirno9.push("I AM THE STRONGEST");
GameData.Chat.Users.Patchy = new Array();
GameData.Chat.Users.Patchy.push("Please stop spamming.");
GameData.Chat.Users.Patchy.push("Marisa, when are you returning my book?");
GameData.Chat.Users.Patchy.push("You are all a bunch of noobs...");
GameData.Chat.Users.Patchy.push("So I have this idea for a rocket...");
GameData.Chat.Users.YuKaRi = new Array();
GameData.Chat.Users.YuKaRi.push("HeY gUyS wAtS gOiNg On?!!1!");
GameData.Chat.Users.YuKaRi.push("OmG mY cAt Is StUcK uP a TrEe AgAiN!!!1!");
GameData.Chat.Users.YuKaRi.push("LOLOL DiD yOu SeE tHe ViD oF rEiMu In K1???");
GameData.Chat.Users.YuKaRi.push("OMG MY SHIFT BUTTON IS STUCK");
GameData.Chat.Users.YuKaRi.push("MaRiSa Is On DrUgS LOL");
GameData.Chat.Users.YuKaRi.push("I nUkEd YuKa LOLOL");
GameData.Chat.UserList = new Array();
/*enumerate*/
while (!(($r0 = <?>) == null)) {
  u = $r0;
  GameData.Chat.UserList.push(u);
}
GameData.Palette = new Object();
GameData.Palette.Skin = new Array();
GameData.Palette.Skin.push("0xFFF1DD");
GameData.Palette.Skin.push("0xFFE7DD");
GameData.Palette.Skin.push("0xDED4BB");
GameData.Palette.Skin.push("0xCC9900");
GameData.Palette.Skin.push("0x663300");
GameData.Palette.Skin.push("0xFFFFCC");
GameData.Palette.Skin.push("0xFFCCFF");
GameData.Palette.Skin.push("0xCCCCFF");
GameData.Palette.Buttons = new Array();
GameData.Palette.Buttons.push("0xFFFFFF");
GameData.Palette.Buttons.push("0xCCCCCC");
GameData.Palette.Buttons.push("0x999999");
GameData.Palette.Buttons.push("0x000000");
GameData.Palette.ScrollBar = new Array();
GameData.Palette.ScrollBar.push("0xFFFFFF");
GameData.Palette.ScrollBar.push("0xE1E1E1");
GameData.Palette.ScrollBar.push("0x999999");
GameData.Sounds = new Object();
GameData.Sounds.Boom = new Sound();
GameData.Sounds.Boom.attachSound("Fire");
GameData.Sounds.ChatBeep = new Sound();
GameData.Sounds.ChatBeep.attachSound("IMbeep");
GameData.Sounds.Boxing = new Sound();
GameData.Sounds.Boxing.attachSound("Owned");
GameData.Sounds.KO = new Sound();
GameData.Sounds.KO.attachSound("KOsound");
GameData.Sounds.Meow = new Sound();
GameData.Sounds.Meow.attachSound("Meow");
GameData.Sounds.Cash = new Sound();
GameData.Sounds.Cash.attachSound("Cash");
GameData.Sounds.Pop = new Sound();
GameData.Sounds.Pop.attachSound("Bubble");
GameData.Sounds.Death = new Sound();
GameData.Sounds.Death.attachSound("Death");
GameData.Sounds.Graze = new Sound();
GameData.Sounds.Graze.attachSound("Graze");
GameData.Sounds.ItemGet = new Sound();
GameData.Sounds.ItemGet.attachSound("ItemGet");
GameData.Sounds.MenuSelect = new Sound();
GameData.Sounds.MenuSelect.attachSound("MenuSelect");
GameData.Sounds.PowerUp = new Sound();
GameData.Sounds.PowerUp.attachSound("PowerUpS");
GameData.Sounds.Truck = new Sound();
GameData.Sounds.Truck.attachSound("TruckHonk");
GameData.Sounds.Kyuh = new Sound();
GameData.Sounds.Kyuh.attachSound("Kyuh");
GameData.Sounds.Whoosh = new Sound();
GameData.Sounds.Whoosh.attachSound("Whoosh");
GameData.Fusion = new Object();
GameData.Fusion.Names = new Array();
GameData.Fusion.Names.push(["Alice", "Marisa", "Malice"]);
GameData.Fusion.Names.push(["Patchouli", "Marisa", "Matchouli"]);
GameData.Fusion.Names.push(["Nitori", "Marisa", "Matori"]);
GameData.Imageboard = new Object();
GameData.Imageboard.PostHeaders = new Array();
GameData.Imageboard.PostHeaders.push(["My NaMe Is YuKaRi", "4/1/08 (Tues) 13:37 No.123"]);
GameData.Imageboard.PostHeaders.push(["wakimiko", "4/1/08 (Tues) 13:39 No.125"]);
GameData.Imageboard.PostHeaders.push(["iLikeKFC", "4/1/08 (Tues) 13:50 No.135"]);
GameData.Imageboard.PostHeaders.push(["Patchy", "4/1/08 (Tues) 13:56 No.138"]);
GameData.Imageboard.PostHeaders.push(["cirno9", "4/1/08 (Tues) 14:00 No.141"]);
GameData.Keys.Up = false;
GameData.Keys.Down = false;
GameData.Keys.Left = false;
GameData.Keys.Right = false;
GameData.TextFormats = new Object();
GameData.TextFormats.Base = new TextFormat();
GameData.TextFormats.Base.font = "Wild Words";
GameData.TextFormats.Base.size = 14;
GameData.TextFormats.Base.color = 0;
GameData.TextFormats.BaseOff = new TextFormat();
GameData.TextFormats.BaseOff.font = "Wild Words";
GameData.TextFormats.BaseOff.size = 14;
GameData.TextFormats.BaseOff.color = 10526880;
GameData.TextFormats.Labels = new TextFormat();
GameData.TextFormats.Labels.font = "Wild Words";
GameData.TextFormats.Labels.size = 14;
GameData.TextFormats.Labels.align = "right";
GameData.TextFormats.Tab = new TextFormat();
GameData.TextFormats.Tab.font = "Wild Words";
GameData.TextFormats.Tab.size = 16;
GameData.TextFormats.Tab.align = "center";
GameData.TextFormats.Header = new TextFormat();
GameData.TextFormats.Header.font = "Wild Words";
GameData.TextFormats.Header.size = 24;
GameData.TextFormats.Header.align = "center";
GameData.TextFormats.FURL = new TextFormat();
GameData.TextFormats.FURL.font = "Arial";
GameData.TextFormats.FURL.size = 14;
GameData.PresetBubbles = new Object();
var i = 1;
while (!(i > 5)) {
  GameData.PresetBubbles["Type" + i] = new Array();
  i = i + 1;
}
GameData.PresetBubbles.Type1.push([335, 28, 10, 1, 1, 3, 5, 0, -131, -1, 0, "Hooray!", "Wild Words"]);
GameData.PresetBubbles.Type1.push([335, 28, 10, 1, 1, 3, 5, 0, -131, -1, 0, "Yippy!", "Wild Words"]);
GameData.PresetBubbles.Type1.push([335, 28, 10, 1, 1, 3, 5, 0, -131, -1, 0, "Wohoo!", "Wild Words"]);
GameData.PresetBubbles.Type1.push([201, 28, 18, 1, 1, 3, 5, 0, -128, -6, 0, "we get\nsignal.", "Wild Words"]);
GameData.PresetBubbles.Type1.push([210, 34, 24, 1, 1, 6, -3, 0, -128, -13, 0, "It's about\nstuff.", "Wild Words"]);
GameData.PresetBubbles.Type1.push([201, 42, 16, 1, 1, 4, 3, 0, -125, -4, 0, "Is that so...", "Wild Words"]);
GameData.PresetBubbles.Type1.push([207, 55, 20, 1, 1, 3, 5, 0, -132, -6, 0, "It's so delicious\nand moist.", "Wild Words"]);
GameData.PresetBubbles.Type1.push([207, 77, 32, 1, 1, -1, 8, 0, -132, -6, 0, "it's like my rattata is\nin the top percentage of\nrattata!", "Wild Words"]);
GameData.PresetBubbles.Type1.push([207, 39, 19, 1, 1, 1, 4, 0, -132, -6, 0, "Stop poking\nme!", "Wild Words"]);
GameData.PresetBubbles.Type1.push([207, 39, 19, 1, 1, 1, 4, 0, -132, -6, 0, "Do a barrel\nroll!", "Wild Words"]);
GameData.PresetBubbles.Type1.push([207, 47, 15, 1, 1, 3, 0, 0, -132, -6, 0, "Where am I?!", "Wild Words"]);
GameData.PresetBubbles.Type2.push([141, 50, 18, 1, 1, 6, 4, 0, -125, -9, 0, "What was I\nthinking about?", "Wild Words"]);
GameData.PresetBubbles.Type2.push([141, 50, 18, 1, 1, 5, 6, 0, -127, 0, 0, "Mmmm....waffles.", "Wild Words"]);
GameData.PresetBubbles.Type3.push([100, 70, 19, 1, 1, 5, -4, 0, -121, -8, 0, "Once Upon a time...", "Wild Words"]);
GameData.PresetBubbles.Type3.push([100, 70, 19, 1, 1, 5, -4, 0, -121, -8, 0, "A moment later...", "Wild Words"]);
GameData.PresetBubbles.Type3.push([100, 73, 26, 1, 1, 7, 3, 0, -121, -8, 0, "and then there\nwas none.", "Wild Words"]);
GameData.PresetBubbles.Type4.push([227, 100, 100, 1, 1, 3, -17, 0, -129.85, 0, 0, "poke", "Geek a byte"]);
GameData.PresetBubbles.Type4.push([227, 100, 100, 1, 1, 3, -17, 0, -127, -8, 0, "skreeeeee", "Brankovic"]);
GameData.PresetBubbles.Type4.push([227, 100, 100, 1, 1, 3, -17, 0, -127, -8, 0, "slash", "Necropsy"]);
GameData.PresetBubbles.Type4.push([153, 100, 100, 1, 1, 3, -17, 0, -127, -8, 0, "\"No way! That's impossible!\"\n- Marisa Kirisame", "GungsuhChe"]);
GameData.PresetBubbles.Type5.push([289, 22, 15, 1, 1, 5, -13, 0, -129, -27, 0, "Wham", "Geek a byte"]);
GameData.PresetBubbles.Type5.push([289, 22, 15, 1, 1, 5, -13, 0, -129, -27, 0, "smack", "Geek a byte"]);
GameData.PresetBubbles.Type5.push([289, 22, 15, 1, 1, 5, -13, 0, -129, -27, 0, "whack", "Geek a byte"]);
GameData.PresetBubbles.Type5.push([289, 22, 15, 1, 1, 5, -13, 0, -129, -27, 0, "smash", "Geek a byte"]);
GameData.PresetBubbles.Type5.push([289, 22, 15, 1, 1, 5, -13, 0, -129, -27, 0, "slam", "Geek a byte"]);
GameData.PresetBubbles.Type5.push([289, 29, 16, 1, 1, 5, -13, 0, -129, -28, 0, "blammo", "Geek a byte"]);
grayscaleA = [];
colorscaleA = [];
inversecolorsA = [];
grayscaleA = grayscaleA.concat([0.33, 0.33, 0.33, 0, 0]);
grayscaleA = grayscaleA.concat([0.33, 0.33, 0.33, 0, 0]);
grayscaleA = grayscaleA.concat([0.33, 0.33, 0.33, 0, 0]);
grayscaleA = grayscaleA.concat([0, 0, 0, 1, 0]);
colorscaleA = colorscaleA.concat([1, 0, 0, 0, 0]);
colorscaleA = colorscaleA.concat([0, 1, 0, 0, 0]);
colorscaleA = colorscaleA.concat([0, 0, 1, 0, 0]);
colorscaleA = colorscaleA.concat([0, 0, 0, 1, 0]);
inversecolorsA = inversecolorsA.concat([0, 1, 1, 0, 0]);
inversecolorsA = inversecolorsA.concat([1, 0, 1, 0, 0]);
inversecolorsA = inversecolorsA.concat([1, 1, 0, 0, 0]);
inversecolorsA = inversecolorsA.concat([0, 0, 0, 1, 0]);
grayfilter = new flash.filters.ColorMatrixFilter(grayscaleA);
colorfilter = new flash.filters.ColorMatrixFilter(colorscaleA);
inversefilter = new flash.filters.ColorMatrixFilter(inversecolorsA);
function () {
  if ((bg.yuyuko._currentframe == 1)) {
    bg.yuyuko.gotoAndStop(2);
  } else {
    StopYuyuko();
  }
}
<?>[GameData.BGFunctions] = "BG76";
function () {
  if (bg.fusionlab.fusion1.char._visible) {
    bg.fusionlab.fusion1.char._visible;
  }
  if (bg.fusionlab.fusion2.char._visible) {
    activateFusion();
  }
}
<?>[GameData.BGFunctions] = "BG40";
function () {
  Interface.createEmptyMovieClip("Win", 9420);
  Interface.Win.createEmptyMovieClip("bg", 10);
  Interface.Win._visible = false;
  Interface.Win.createTextField("Title", 20, 0, 0, 10, 30);
  Interface.Win.Title.setNewTextFormat(GameData.TextFormats.Header);
  Interface.Win.Title.selectable = false;
  Interface.Win.Title.embedFonts = true;
  Interface.Win.createEmptyMovieClip("CloseB", 10000);
  Interface.Win.CloseB.createTextField("D", 20, 0, 0, 100, 20);
  Interface.Win.CloseB.D.setNewTextFormat(GameData.TextFormats.Tab);
  Interface.Win.CloseB.D.selectable = false;
  Interface.Win.CloseB.D.border = true;
  Interface.Win.CloseB.D.background = true;
  Interface.Win.CloseB.D.embedFonts = true;
  Interface.Win.CloseB.D.text = "Close";
  function () {
    this._parent._visible = false;
  }
  <?>[Interface.Win.CloseB] = "onRelease";
}
<?>[GameData.Windows] = "New";
GameData.Windows.Options = new Object();
function () {
  Interface.Win._visible = true;
  Interface.Win.vSpace = 60;
  $r4 = 300;
  $r5 = 300;
  Interface.Win.bg.clear();
  Interface.Win.bg.beginFill(GameData.Palette.Buttons[0], 80);
  Interface.Win.bg.lineStyle();
  Interface.Win.bg.moveTo(0, 0);
  Interface.Win.bg.lineTo(0, $r5);
  Interface.Win.bg.lineTo($r4, $r5);
  Interface.Win.bg.lineTo($r4, 0);
  Interface.Win.bg.lineTo(0, 0);
  Interface.Win.bg.endFill();
  Interface.Win.bg.moveTo(10, 30);
  Interface.Win.bg.lineTo($r4 - 10, 30);
  function () {
    this._parent.startDrag();
  }
  <?>[Interface.Win.bg] = "onPress";
  function () {
    this._parent.stopDrag();
  }
  "onRelease"[Interface.Win.bg] = $r0 = "onReleaseOutside";
  <?>[Interface.Win.bg] = $r0;
  Interface.Win.Title._width = $r4;
  Interface.Win.Title.text = "Options";
  Interface.Win.CloseB._x = ($r4 - 100) / 2;
  Interface.Win.CloseB._y = $r5 - 30;
  var tabArray = new Array("Options", "Settings", "Hotkeys");
  var tabW = $r4 / tabArray.length;
  $r3 = 20;
  Interface.Win.createEmptyMovieClip("Tabs", 30);
  Interface.Win.Tabs._y = 35;
  Interface.Win.Tabs.ID = 0;
  Interface.Win.Tabs.createEmptyMovieClip("Hit", 0);
  Interface.Win.Tabs.Hit.beginFill(GameData.Palette.Buttons[1], 0);
  Interface.Win.Tabs.Hit.lineStyle();
  Interface.Win.Tabs.Hit.moveTo(0, 0);
  Interface.Win.Tabs.Hit.lineTo(0, $r3);
  Interface.Win.Tabs.Hit.lineTo($r4, $r3);
  Interface.Win.Tabs.Hit.lineTo($r4, 0);
  Interface.Win.Tabs.Hit.lineTo(0, 0);
  Interface.Win.Tabs.Hit.endFill();
  function () {
    this._parent.ID = Math.floor(this._xmouse / tabW);
    this._parent._parent.CloseB._visible = true;
    GameData.Windows.Options[tabArray[this._parent.ID]]();
  }
  <?>[Interface.Win.Tabs.Hit] = "onRelease";
  Interface.Win.Tabs.createEmptyMovieClip("Marker", 10);
  Interface.Win.Tabs.Marker.beginFill(GameData.Palette.Buttons[1], 80);
  Interface.Win.Tabs.Marker.lineStyle();
  Interface.Win.Tabs.Marker.moveTo(5, 0);
  Interface.Win.Tabs.Marker.lineTo(5, $r3);
  Interface.Win.Tabs.Marker.lineTo(tabW - 5, $r3);
  Interface.Win.Tabs.Marker.lineTo(tabW - 5, 0);
  Interface.Win.Tabs.Marker.lineTo(5, 0);
  Interface.Win.Tabs.Marker.endFill();
  function () {
    this._x = this._x + (this._parent.ID * tabW - this._x) / 5;
  }
  <?>[Interface.Win.Tabs.Marker] = "onEnterFrame";
  $r2 = 0;
  while (($r2 < tabArray.length)) {
    Interface.Win.Tabs.createTextField("Tab" + $r2, 20 + $r2, tabW * $r2, 0, tabW, $r3);
    Interface.Win.Tabs["Tab" + $r2].setNewTextFormat(GameData.TextFormats.Tab);
    Interface.Win.Tabs["Tab" + $r2].selectable = false;
    Interface.Win.Tabs["Tab" + $r2].embedFonts = true;
    Interface.Win.Tabs["Tab" + $r2].text = tabArray[$r2];
    $r2 = $r2 + 1;
  }
  GameData.Windows.Options.Options();
}
<?>[GameData.Windows.Options] = "Open";
function () {
  Interface.Win.createEmptyMovieClip("Main", 50);
  Interface.Win.Main._y = Interface.Win.vSpace;
  Interface.Win.Main.createTextField("Labels", 10, 25, 0, 250, 300);
  Interface.Win.Main.Labels.setNewTextFormat(GameData.TextFormats.Base);
  Interface.Win.Main.Labels.selectable = falsre;
  Interface.Win.Main.Labels.embedFonts = true;
  $r3 = "";
  $r2 = 0;
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    m = $r0;
    if ((GameData.Settings[m].Value == undefined)) {
      Interface.Win.Main.attachMovie("checkbox", "ID" + $r2, $r2 + 50);
      Interface.Win.Main["ID" + $r2]._x = 15;
      Interface.Win.Main["ID" + $r2]._y = $r2 * 13.5 + 8;
      Interface.Win.Main["ID" + $r2]._xscale = 60;
      Interface.Win.Main["ID" + $r2]._yscale = 60;
      Interface.Win.Main["ID" + $r2].Op = m;
      if (GameData.Settings[m].Check) {
        Interface.Win.Main["ID" + $r2].gotoAndStop(2);
      } else {
        Interface.Win.Main["ID" + $r2].gotoAndStop(1);
      }
      function () {
        ToggleSetting(this, this.Op);
      }
      <?>[Interface.Win.Main["ID" + $r2]] = "onRelease";
      $r2 = $r2 + 1;
      $r3 = $r3 + (GameData.Settings[m].Info + "\n");
    }
  }
  Interface.Win.Main.Labels.text = $r3;
}
<?>[GameData.Windows.Options] = "Options";
function () {
  Interface.Win.createEmptyMovieClip("Main", 50);
  Interface.Win.Main._y = Interface.Win.vSpace;
  $r2 = 0;
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    m = $r0;
    if (GameData.Settings[m].Value) {
      Interface.Win.Main.createEmptyMovieClip("S" + $r2, 10 + $r2);
      Interface.Win.Main["S" + $r2]._y = $r2 * 20;
      Interface.Win.Main["S" + $r2].ID = m;
      Interface.Win.Main["S" + $r2].createTextField("L", 10, 0, 0, 150, 16);
      Interface.Win.Main["S" + $r2].L.setNewTextFormat(GameData.TextFormats.Labels);
      Interface.Win.Main["S" + $r2].L.selectable = false;
      Interface.Win.Main["S" + $r2].L.embedFonts = true;
      Interface.Win.Main["S" + $r2].L.text = GameData.Settings[m].Info + ":";
      Interface.Win.Main["S" + $r2].createTextField("I", 20, 155, 0, 100, 16);
      Interface.Win.Main["S" + $r2].I.setNewTextFormat(GameData.TextFormats.Base);
      Interface.Win.Main["S" + $r2].I.type = "input";
      Interface.Win.Main["S" + $r2].I.embedFonts = true;
      Interface.Win.Main["S" + $r2].I.border = true;
      Interface.Win.Main["S" + $r2].I.text = GameData.Settings[m].Value;
      function () {
        GameData.KeyLock = true;
      }
      <?>[Interface.Win.Main["S" + $r2].I] = "onSetFocus";
      function () {
        GameData.Settings[this._parent.ID].Value = this.text;
        my_so.data[this._parent.ID] = GameData.Settings[this._parent.ID].Value;
        my_so.flush();
        GameData.KeyLock = false;
      }
      <?>[Interface.Win.Main["S" + $r2].I] = "onKillFocus";
      $r2 = $r2 + 1;
    }
  }
}
<?>[GameData.Windows.Options] = "Settings";
function () {
  Interface.Win.CloseB._visible = false;
  Interface.Win.createEmptyMovieClip("Main", 50);
  Interface.Win.Main._y = Interface.Win.vSpace;
  Interface.Win.Main.createTextField("Labels", 30, 110, 0, 200, 16);
  Interface.Win.Main.Labels.setNewTextFormat(GameData.TextFormats.Base);
  Interface.Win.Main.Labels.selectable = false;
  Interface.Win.Main.Labels.embedFonts = true;
  Interface.Win.Main.Labels.text = "Eyes    Mouth";
  $r2 = 0;
  while (($r2 < 10)) {
    Interface.Win.Main.createEmptyMovieClip("S" + $r2, 10 + $r2);
    Interface.Win.Main["S" + $r2]._y = $r2 * 20;
    Interface.Win.Main["S" + $r2].ID = $r2;
    Interface.Win.Main["S" + $r2].createTextField("L", 10, 0, 0, 100, 16);
    Interface.Win.Main["S" + $r2].L.setNewTextFormat(GameData.TextFormats.Labels);
    Interface.Win.Main["S" + $r2].L.selectable = false;
    Interface.Win.Main["S" + $r2].L.embedFonts = true;
    Interface.Win.Main["S" + $r2].L.text = "Hotkey" + $r2 + ":";
    Interface.Win.Main.attachMovie("checkbox", "cbE" + $r2, $r2 + 50);
    Interface.Win.Main["cbE" + $r2]._x = 110;
    Interface.Win.Main["cbE" + $r2]._y = $r2 * 20 + 8;
    Interface.Win.Main["cbE" + $r2]._xscale = 70;
    Interface.Win.Main["cbE" + $r2]._yscale = 70;
    Interface.Win.Main["cbE" + $r2].Op = $r2;
    if (GameData.Hotkeys[$r2][0]) {
      Interface.Win.Main["cbE" + $r2].gotoAndStop(2);
    } else {
      Interface.Win.Main["cbE" + $r2].gotoAndStop(1);
    }
    function () {
      if (GameData.Hotkeys[this.Op][0]) {
        GameData.Hotkeys[this.Op][0] = false;
        Interface.Win.Main["S" + this.Op].Eye.setTextFormat(GameData.TextFormats.BaseOff);
        Interface.Win.Main["S" + this.Op].Eye.setNewTextFormat(GameData.TextFormats.BaseOff);
        this.gotoAndStop(1);
      } else {
        GameData.Hotkeys[this.Op][0] = true;
        Interface.Win.Main["S" + this.Op].Eye.setTextFormat(GameData.TextFormats.Base);
        Interface.Win.Main["S" + this.Op].Eye.setNewTextFormat(GameData.TextFormats.Base);
        this.gotoAndStop(2);
      }
      my_so.data.Hotkeys = GameData.Hotkeys;
      my_so.flush();
    }
    <?>[Interface.Win.Main["cbE" + $r2]] = "onRelease";
    Interface.Win.Main["S" + $r2].createTextField("Eye", 20, 125, 0, 30, 16);
    if (GameData.Hotkeys[$r2][0]) {
      Interface.Win.Main["S" + $r2].Eye.setNewTextFormat(GameData.TextFormats.Base);
    } else {
      Interface.Win.Main["S" + $r2].Eye.setNewTextFormat(GameData.TextFormats.BaseOff);
    }
    Interface.Win.Main["S" + $r2].Eye.type = "input";
    Interface.Win.Main["S" + $r2].Eye.embedFonts = true;
    Interface.Win.Main["S" + $r2].Eye.border = true;
    Interface.Win.Main["S" + $r2].Eye.text = Number(GameData.Hotkeys[$r2][2]) + 1;
    function () {
      GameData.KeyLock = true;
    }
    <?>[Interface.Win.Main["S" + $r2].Eye] = "onSetFocus";
    function () {
      GameData.Hotkeys[this._parent.ID][2] = Number(this.text) - 1;
      my_so.data.Hotkeys = GameData.Hotkeys;
      my_so.flush();
      GameData.KeyLock = false;
    }
    <?>[Interface.Win.Main["S" + $r2].Eye] = "onKillFocus";
    Interface.Win.Main.attachMovie("checkbox", "cbM" + $r2, $r2 + 70);
    Interface.Win.Main["cbM" + $r2]._x = 170;
    Interface.Win.Main["cbM" + $r2]._y = $r2 * 20 + 8;
    Interface.Win.Main["cbM" + $r2]._xscale = 70;
    Interface.Win.Main["cbM" + $r2]._yscale = 70;
    Interface.Win.Main["cbM" + $r2].Op = $r2;
    if (GameData.Hotkeys[$r2][1]) {
      Interface.Win.Main["cbM" + $r2].gotoAndStop(2);
    } else {
      Interface.Win.Main["cbM" + $r2].gotoAndStop(1);
    }
    function () {
      if (GameData.Hotkeys[this.Op][1]) {
        GameData.Hotkeys[this.Op][1] = false;
        Interface.Win.Main["S" + this.Op].Mouth.setTextFormat(GameData.TextFormats.BaseOff);
        Interface.Win.Main["S" + this.Op].Mouth.setNewTextFormat(GameData.TextFormats.BaseOff);
        this.gotoAndStop(1);
      } else {
        GameData.Hotkeys[this.Op][1] = true;
        Interface.Win.Main["S" + this.Op].Mouth.setTextFormat(GameData.TextFormats.Base);
        Interface.Win.Main["S" + this.Op].Mouth.setNewTextFormat(GameData.TextFormats.Base);
        this.gotoAndStop(2);
      }
      my_so.data.Hotkeys = GameData.Hotkeys;
      my_so.flush();
    }
    <?>[Interface.Win.Main["cbM" + $r2]] = "onRelease";
    Interface.Win.Main["S" + $r2].createTextField("Mouth", 30, 190, 0, 30, 16);
    if (GameData.Hotkeys[$r2][1]) {
      Interface.Win.Main["S" + $r2].Mouth.setNewTextFormat(GameData.TextFormats.Base);
    } else {
      Interface.Win.Main["S" + $r2].Mouth.setNewTextFormat(GameData.TextFormats.BaseOff);
    }
    Interface.Win.Main["S" + $r2].Mouth.type = "input";
    Interface.Win.Main["S" + $r2].Mouth.embedFonts = true;
    Interface.Win.Main["S" + $r2].Mouth.border = true;
    Interface.Win.Main["S" + $r2].Mouth.text = Number(GameData.Hotkeys[$r2][3]) + 1;
    function () {
      GameData.KeyLock = true;
    }
    <?>[Interface.Win.Main["S" + $r2].Mouth] = "onSetFocus";
    function () {
      GameData.Hotkeys[this._parent.ID][3] = Number(this.text) - 1;
      my_so.data.Hotkeys = GameData.Hotkeys;
      my_so.flush();
      GameData.KeyLock = false;
    }
    <?>[Interface.Win.Main["S" + $r2].Mouth] = "onKillFocus";
    sID = sID + 1;
    $r2 = $r2 + 1;
  }
  Interface.Win.Main.cbE0._y = 208;
  Interface.Win.Main.cbM0._y = 208;
  Interface.Win.Main.S0._y = 200;
}
<?>[GameData.Windows.Options] = "Hotkeys";
function () {
  if (!GameData.KeyLock) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      k = $r0;
      $r1 = false;
      if ((GameData.Keys.Buttons[k].Check == "Dev")) {
        if (GameData.DevMode) {
          $r1 = true;
        } else {
          $r1 = false;
        }
      } else {
        if ((GameData.Keys.Buttons[k].Check == "Pin")) {
          if (GameData.Settings.KeylockPinned.Check) {
            GameData.Settings.KeylockPinned.Check;
          }
          if (GameData.Target.Pin) {
            !GameData.Target.Pin;
          }
          if (!GameData.Settings.KeylockPinned.Check) {
            $r1 = true;
          } else {
            $r1 = false;
          }
        } else {
          $r1 = true;
        }
      }
      if (Key.isDown(GameData.Keys.Buttons[k].Code)) {
        Key.isDown(GameData.Keys.Buttons[k].Code);
      }
      if ($r1) {
        if (!GameData.Keys.Buttons[k].Pressed) {
          if (!(GameData.Keys.Buttons[k].ID == undefined)) {
            GameData.Keys.Functions[k](GameData.Keys.Buttons[k].ID);
          } else {
            GameData.Keys.Functions[k]();
          }
          GameData.Keys.Buttons[k].Pressed = true;
        }
      } else {
        GameData.Keys.Buttons[k].Pressed = false;
      }
    }
    GameData.Keys.Functions.ArrowKeyMain();
  }
}
<?>[GameData.Keys.Functions] = "Main";
GameData.Keys.Buttons = new Object();
var i = 0;
while ((i < 10)) {
  newKey("Hotkey" + i, 48 + i, "Pin");
  GameData.Keys.Buttons["Hotkey" + i].ID = i;
  function (ID) {
    if ((GameData.TargetType == "Character")) {
      if (GameData.Hotkeys[ID][0]) {
        RootPartSwap(GameData.Target.eyes, "Eyes", String(GameData.Hotkeys[ID][2]));
      }
      if (GameData.Hotkeys[ID][1]) {
        RootPartSwap(GameData.Target.mouth, "Mouth", String(GameData.Hotkeys[ID][3]));
      }
    }
  }
  <?>[GameData.Keys.Functions] = "Hotkey" + i;
  i = i + 1;
}
newKey("DevKey", 192, "Dev");
function () {
  if ((GameData.TargetType == "SpeechBubble")) {
    $r1 = GameData.Target._name;
    trace("GameData.PresetBubbles.Type" + GameData.SpeechBubbles[$r1].Type + ".push([" + GameData.SpeechBubbles[$r1].Scale + "," + GameData.SpeechBubbles[$r1].XScale + "," + GameData.SpeechBubbles[$r1].YScale + "," + stage[$r1].Bubble.XFace + "," + stage[$r1].Bubble.YFace + "," + stage[$r1].Bubble._x + "," + stage[$r1].Bubble._y + "," + stage[$r1].Bubble._rotation + "," + stage[$r1].D._x + "," + stage[$r1].D._y + "," + stage[$r1].D._rotation + ",\"" + stage[$r1].D.text + "\",\"" + stage[$r1].FontType + "\"]);");
  } else {
    if ((GameData.TargetType == "Character")) {
      trace("newPreset(\"" + GameData.Characters[GameData.Target._name].Name + "\"," + GameData.Characters[GameData.Target._name].bodyFrame + "," + GameData.Characters[GameData.Target._name].eyeFrame + "," + GameData.Characters[GameData.Target._name].mouthFrame + "," + GameData.Characters[GameData.Target._name].headFrame + "," + GameData.Characters[GameData.Target._name].hatFrame + "," + GameData.Characters[GameData.Target._name].armFrame + "," + GameData.Characters[GameData.Target._name].shoeFrame + "," + GameData.Characters[GameData.Target._name].itemFrame + "," + GameData.Characters[GameData.Target._name].wingFrame + "," + GameData.Characters[GameData.Target._name].accFrame + ");");
    }
  }
}
<?>[GameData.Keys.Functions] = "DevKey";
newKey("UIKey", 32);
function () {
  if (Interface._visible) {
    Interface._visible = false;
    SysConsole._visible = false;
    if (GameData.Settings.TheaterMode.Check) {
      ClearClickHandlers();
    }
    Manipulator._visible = false;
  } else {
    Interface._visible = true;
    SysConsole._visible = true;
    if (!GameData.Settings.UntargetablePinned.Check) {
      SetClickHandlers();
    }
    if (GameData.Target) {
      GameData.Target;
    }
    if (GameData.ShowManipulator) {
      Manipulator._visible = true;
    }
  }
}
<?>[GameData.Keys.Functions] = "UIKey";
newKey("GravKey", 71);
function () {
  if (stage["Gravity Well"]._visible) {
    stage["Gravity Well"]._x = _root._xmouse;
    stage["Gravity Well"]._y = _root._ymouse;
    clickCheck(stage["Gravity Well"], "drag");
    GameData.DoubleClick = 0;
  }
}
<?>[GameData.Keys.Functions] = "GravKey";
function () {
  if (Key.isDown(16)) {
    Key.isDown(16);
  }
  if (GameData.Settings.SwitchArrows.Check) {
    !GameData.Settings.SwitchArrows.Check;
    if (Key.isDown(17)) {
      Key.isDown(17);
    }
  }
  if (GameData.Settings.SwitchArrows.Check) {
    GameData.Target._rotation = GameData.Target._rotation + GameData.Settings.ASpeed.Value;
  } else {
    if (Key.isDown(16)) {
      Key.isDown(16);
    }
    if (!GameData.Settings.SwitchArrows.Check) {
      GameData.Settings.SwitchArrows.Check;
      if (Key.isDown(17)) {
        Key.isDown(17);
      }
    }
    if (!GameData.Settings.SwitchArrows.Check) {
      GameData[getArray()][GameData.Target._name].Scale = GameData[getArray()][GameData.Target._name].Scale + GameData.Settings.ASpeed.Value;
      fixTargetScale(GameData[getArray()][GameData.Target._name].Scale);
    } else {
      GameData.Target._x = GameData.Target._x + GameData.Settings.ASpeed.Value;
    }
  }
}
<?>[GameData.Keys.Functions] = "RightBudge";
function () {
  if (Key.isDown(16)) {
    Key.isDown(16);
  }
  if (GameData.Settings.SwitchArrows.Check) {
    !GameData.Settings.SwitchArrows.Check;
    if (Key.isDown(17)) {
      Key.isDown(17);
    }
  }
  if (GameData.Settings.SwitchArrows.Check) {
    GameData.Target._rotation = GameData.Target._rotation - GameData.Settings.ASpeed.Value;
  } else {
    if (Key.isDown(16)) {
      Key.isDown(16);
    }
    if (!GameData.Settings.SwitchArrows.Check) {
      GameData.Settings.SwitchArrows.Check;
      if (Key.isDown(17)) {
        Key.isDown(17);
      }
    }
    if (!GameData.Settings.SwitchArrows.Check) {
      if (!(GameData[getArray()][GameData.Target._name].Scale - GameData.Settings.ASpeed.Value < GameData.ScaleLimit)) {
        GameData[getArray()][GameData.Target._name].Scale = GameData[getArray()][GameData.Target._name].Scale - GameData.Settings.ASpeed.Value;
        fixTargetScale(GameData[getArray()][GameData.Target._name].Scale);
      } else {
        GameData[getArray()][GameData.Target._name].Scale = GameData.ScaleLimit;
        fixTargetScale(GameData[getArray()][GameData.Target._name].Scale);
      }
    } else {
      GameData.Target._x = GameData.Target._x - GameData.Settings.ASpeed.Value;
    }
  }
}
<?>[GameData.Keys.Functions] = "LeftBudge";
newKey("NextTarget", 221);
function () {
  $r1 = false;
  if (Key.isDown(16)) {
    i = GameData.Depths.StageList.length - 1;
    while (!(i < 0)) {
      if (stage[GameData.Depths.StageList[i].Name].Pin) {
        stage[GameData.Depths.StageList[i].Name].Pin;
      }
      if (!ft) {
        var ft = stage[GameData.Depths.StageList[i].Name];
      }
      if ((GameData.Depths.StageList[i].Depth > GameData.DLSelect)) {
        if (stage[GameData.Depths.StageList[i].Name].Pin) {
          Target(stage[GameData.Depths.StageList[i].Name]);
          GameData.DLSelect = GameData.Depths.StageList[i].Depth;
          $r1 = true;
        } else {
          i = i - 1;
          goto L210231;
        }
      } else {
        i = i - 1;
        goto L210231;
      }
    }
  } else {
    var ft = stage[GameData.Depths.StageList[GameData.Depths.StageList.length - 1].Name];
    i = GameData.Depths.StageList.length - 1;
    while (!(i < 0)) {
      if ((GameData.Depths.StageList[i].Depth > GameData.DLSelect)) {
        Target(stage[GameData.Depths.StageList[i].Name]);
        GameData.DLSelect = GameData.Depths.StageList[i].Depth;
        $r1 = true;
      } else {
        i = i - 1;
        goto L210697;
      }
    }
  }
  if (!$r1) {
    Target(ft);
  }
}
<?>[GameData.Keys.Functions] = "NextTarget";
newKey("PrevTarget", 219);
function () {
  $r1 = false;
  if (Key.isDown(16)) {
    i = 0;
    while ((i < GameData.Depths.StageList.length)) {
      if (stage[GameData.Depths.StageList[i].Name].Pin) {
        stage[GameData.Depths.StageList[i].Name].Pin;
      }
      if (!ft) {
        var ft = stage[GameData.Depths.StageList[i].Name];
      }
      if ((GameData.Depths.StageList[i].Depth < GameData.DLSelect)) {
        if (stage[GameData.Depths.StageList[i].Name].Pin) {
          Target(stage[GameData.Depths.StageList[i].Name]);
          GameData.DLSelect = GameData.Depths.StageList[i].Depth;
          $r1 = true;
        } else {
          i = i + 1;
          goto L211039;
        }
      } else {
        i = i + 1;
        goto L211039;
      }
    }
  } else {
    var ft = stage[GameData.Depths.StageList[0].Name];
    i = 0;
    while ((i < GameData.Depths.StageList.length)) {
      if ((GameData.Depths.StageList[i].Depth < GameData.DLSelect)) {
        Target(stage[GameData.Depths.StageList[i].Name]);
        GameData.DLSelect = GameData.Depths.StageList[i].Depth;
        $r1 = true;
      } else {
        i = i + 1;
        goto L211474;
      }
    }
  }
  if (!$r1) {
    Target(ft);
  }
}
<?>[GameData.Keys.Functions] = "PrevTarget";
newKey("ActivateBG", 66);
function () {
  if (bg._visible) {
    bg._visible;
  }
  if (GameData.BGFunctions["BG" + bg._currentframe]) {
    GameData.BGFunctions["BG" + bg._currentframe]();
  } else {
    bg.Anim.play();
  }
}
<?>[GameData.Keys.Functions] = "ActivateBG";
newKey("Snapshot", 83);
function () {
  makeScreenShot();
}
<?>[GameData.Keys.Functions] = "Snapshot";
newKey("Colorize", 67, "Pin");
function () {
  if (!(GameData.TargetType == "Character")) {
    GameData.TargetType == "Character";
  }
  if ((GameData.TargetType == "SpeechBubble")) {
    GameData.Menus.Functions.ColorizeMenu();
  } else {
    if ((GameData.TargetType == "Object")) {
      GameData.Target.Obj.play();
    } else {
      if ((GameData.TargetType == "Cluster")) {
        if ((GameData.Clusters[GameData.Target._name].cFrame == GameData.Clusters[GameData.Target._name].mFrame)) {
          GameData.Clusters[GameData.Target._name].cFrame = 1;
        } else {
          GameData.Clusters[GameData.Target._name].cFrame = GameData.Clusters[GameData.Target._name].cFrame + 1;
        }
        fixCluster(GameData.Target);
      } else {
        if ((GameData.TargetType == "Rain")) {
          if ((GameData.Rain[GameData.Target._name].cFrame == GameData.Rain[GameData.Target._name].mFrame)) {
            GameData.Rain[GameData.Target._name].cFrame = 1;
          } else {
            GameData.Rain[GameData.Target._name].cFrame = GameData.Rain[GameData.Target._name].cFrame + 1;
          }
          fixRain(GameData.Target);
        }
      }
    }
  }
}
<?>[GameData.Keys.Functions] = "Colorize";
newKey("Clusterize", 68, "Pin");
function () {
  if ((GameData.TargetType == "Object")) {
    GameData.Menus.Functions.Clusterize();
  } else {
    if ((GameData.TargetType == "Character")) {
      GameData.Menus.Functions.DupeChar();
    }
  }
}
<?>[GameData.Keys.Functions] = "Clusterize";
newKey("TargetKey", 84, "Pin");
function () {
  if (GameData.Target._visible) {
    GameData.Target._x = _root._xmouse;
    GameData.Target._y = _root._ymouse;
    clickCheck(GameData.Target, "drag");
    GameData.DoubleClick = 0;
  }
}
<?>[GameData.Keys.Functions] = "TargetKey";
newKey("RandomKey", 82, "Pin");
function () {
  if ((GameData.TargetType == "Character")) {
    if (Key.isDown(16)) {
      GameData.Menus.Functions.SetRandomColor();
    } else {
      RandomizeAll(GameData.Target);
    }
  } else {
    if ((GameData.TargetType == "Object")) {
      if (!GameData.Keys.R) {
        GameData.Menus.Functions.TurnIntoRain();
        GameData.Keys.R = true;
      }
    }
  }
}
<?>[GameData.Keys.Functions] = "RandomKey";
newKey("Delete", 46, "Pin");
function () {
  if ((GameData.TargetType == "Toy")) {
    if ((GameData.Target._name == "Boxing Chen")) {
      resetBoxingChen();
    }
    GameData.Target._visible = false;
    Target();
  } else {
    if (GameData.Target) {
      GameData.Target;
    }
    if (!Interface.COMenu._visible) {
      !Interface.COMenu._visible;
    }
    if (!Interface.BubbleWindow._visible) {
      Delete(GameData.Target);
    }
  }
  Manipulator._visible = false;
}
<?>[GameData.Keys.Functions] = "Delete";
newKey("LockAll", 76, "Pin");
function () {
  if ((GameData.TargetType == "Character")) {
    if (Key.isDown(16)) {
      i = 0;
      while ((i < GameData.PartsArray.length)) {
        GameData.Characters[GameData.Target._name].Locks[GameData.PartsArray[i]] = false;
        i = i + 1;
      }
    } else {
      i = 0;
      while ((i < GameData.PartsArray.length)) {
        GameData.Characters[GameData.Target._name].Locks[GameData.PartsArray[i]] = true;
        i = i + 1;
      }
    }
  }
}
<?>[GameData.Keys.Functions] = "LockAll";
newKey("Flip", 70, "Pin");
function () {
  if (Key.isDown(16)) {
    VFlip();
  } else {
    HFlip();
  }
}
<?>[GameData.Keys.Functions] = "Flip";
newKey("ManipTool", 77);
function () {
  if (GameData.ShowManipulator) {
    GameData.ShowManipulator = false;
    Manipulator._visible = false;
  } else {
    GameData.ShowManipulator = true;
    if (GameData.Target) {
      setManipulator();
    }
  }
}
<?>[GameData.Keys.Functions] = "ManipTool";
newKey("NewChar", 45);
function () {
  makeChar();
}
<?>[GameData.Keys.Functions] = "NewChar";
newKey("SaveScene", 81);
function () {
  if (Key.isDown(16)) {
    GameData.Menus.Functions.SaveScene();
  } else {
    GameData.Menus.Functions.MakeNewAct();
  }
}
<?>[GameData.Keys.Functions] = "SaveScene";
newKey("PinToggle", 80);
function () {
  if (GameData.Target.Pin) {
    GameData.Target.Pin = false;
    Interface.TargetFrame.pin._visible = false;
    if (GameData.Settings.UntargetablePinned.Check) {
      AddClickHandler(GameData.Target, GameData.TargetType);
    }
  } else {
    GameData.Target.Pin = true;
    Interface.TargetFrame.pin._visible = true;
    if (GameData.Settings.UntargetablePinned.Check) {
      RemoveClickHandler(GameData.Target, GameData.TargetType);
    }
  }
}
<?>[GameData.Keys.Functions] = "PinToggle";
function () {
  if (GameData.Settings.KeylockPinned.Check) {
    GameData.Settings.KeylockPinned.Check;
  }
  if (GameData.Target.Pin) {
    !GameData.Target.Pin;
  }
  if (!GameData.Settings.KeylockPinned.Check) {
    if (Key.isDown(38)) {
      if (Key.isDown(16)) {
        if (!GameData.Keys.Up) {
          BringForward(GameData.Target);
          GameData.Keys.Up = true;
        }
      } else {
        if (Key.isDown(17)) {
          if (!GameData.Keys.Up) {
            BringToFront(GameData.Target);
            GameData.Keys.Up = true;
          }
        } else {
          if (!GameData.Keys.Up) {
            GameData.Target._y = GameData.Target._y - GameData.Settings.ASpeed.Value;
            GameData.Keys.Up = true;
            GameData.Keys.UpHold = 0;
          } else {
            if ((GameData.Keys.UpHold < 15)) {
              GameData.Keys.UpHold = GameData.Keys.UpHold + 1;
            } else {
              GameData.Target._y = GameData.Target._y - GameData.Settings.ASpeed.Value;
            }
          }
        }
      }
    } else {
      GameData.Keys.Up = false;
    }
    if (Key.isDown(40)) {
      if (Key.isDown(16)) {
        if (!GameData.Keys.Down) {
          SendBackward(GameData.Target);
          GameData.Keys.Down = true;
        }
      } else {
        if (Key.isDown(17)) {
          if (!GameData.Keys.Down) {
            SendToBack(GameData.Target);
            GameData.Keys.Down = true;
          }
        } else {
          if (!GameData.Keys.Down) {
            GameData.Target._y = GameData.Target._y + GameData.Settings.ASpeed.Value;
            GameData.Keys.Down = true;
            GameData.Keys.DownHold = 0;
          } else {
            if ((GameData.Keys.DownHold < 15)) {
              GameData.Keys.DownHold = GameData.Keys.DownHold + 1;
            } else {
              GameData.Target._y = GameData.Target._y + GameData.Settings.ASpeed.Value;
            }
          }
        }
      }
    } else {
      GameData.Keys.Down = false;
    }
    if (Key.isDown(37)) {
      if (!GameData.Keys.Left) {
        GameData.Keys.Left = true;
        GameData.Keys.LeftHold = 0;
        if (GameData.Settings.TheaterMode.Check) {
          GameData.Settings.TheaterMode.Check;
        }
        if (!Interface._visible) {
          if ((GameData.CurrentScene.CurrentAct > 0)) {
            GameData.Menus.Functions.LoadScene(this, GameData.CurrentScene.Name, GameData.CurrentScene.CurrentAct - 1);
          } else {
            if (GameData.SavedSceneData[GameData.CurrentScene.Prev.toLowerCase()]) {
              GameData.Menus.Functions.LoadScene(this, GameData.CurrentScene.Prev.toLowerCase(), GameData.SavedSceneData[GameData.CurrentScene.Prev.toLowerCase()].Acts.length - 1);
            }
          }
        } else {
          GameData.Keys.Functions.LeftBudge();
        }
      } else {
        if ((GameData.Keys.LeftHold < 15)) {
          GameData.Keys.LeftHold = GameData.Keys.LeftHold + 1;
        } else {
          if (GameData.Settings.TheaterMode.Check) {
            GameData.Settings.TheaterMode.Check;
          }
          if (!Interface._visible) {
          } else {
            GameData.Keys.Functions.LeftBudge();
          }
        }
      }
    } else {
      GameData.Keys.Left = false;
    }
    if (Key.isDown(39)) {
      if (!GameData.Keys.Right) {
        GameData.Keys.Right = true;
        GameData.Keys.RightHold = 0;
        if (GameData.Settings.TheaterMode.Check) {
          GameData.Settings.TheaterMode.Check;
        }
        if (!Interface._visible) {
          if ((GameData.CurrentScene.CurrentAct < GameData.SavedSceneData[GameData.CurrentScene.Name].Acts.length - 1)) {
            GameData.Menus.Functions.LoadScene(this, GameData.CurrentScene.Name, GameData.CurrentScene.CurrentAct + 1);
          } else {
            if (GameData.SavedSceneData[GameData.CurrentScene.Next.toLowerCase()]) {
              GameData.Menus.Functions.LoadScene(this, GameData.CurrentScene.Next.toLowerCase(), 0);
            }
          }
        } else {
          GameData.Keys.Functions.RightBudge();
        }
      } else {
        if ((GameData.Keys.RightHold < 15)) {
          GameData.Keys.RightHold = GameData.Keys.RightHold + 1;
        } else {
          if (GameData.Settings.TheaterMode.Check) {
            GameData.Settings.TheaterMode.Check;
          }
          if (!Interface._visible) {
          } else {
            GameData.Keys.Functions.RightBudge();
          }
        }
      }
    } else {
      GameData.Keys.Right = false;
    }
  }
}
<?>[GameData.Keys.Functions] = "ArrowKeyMain";
function (S) {
  trace("Put scene xml here.");
}
<?>[GameData.Menus.Functions] = "GenerateSceneXML";
function (S, LS, actN) {
  $r3 = GameData.SavedSceneData[LS].Acts[actN];
  if (!GameData.SavedSceneData[LS].Ver) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      sfix = $r0;
      if ((GameData.SavedSceneData[LS][$r3][sfix][0] == "Object")) {
        GameData.SavedSceneData[LS][$r3][sfix][1] = GameData.ObjectList[GameData.SavedSceneData[LS][$r3][sfix][1]][1];
      }
    }
    GameData.SavedSceneData[LS].Ver = 3.36;
  }
  GameData.CurrentScene.Name = LS;
  GameData.CurrentScene.Prev = GameData.SavedSceneData[LS].Prev;
  GameData.CurrentScene.Next = GameData.SavedSceneData[LS].Next;
  GameData.Menus.Functions.Clear(this, "All");
  sa = 0;
  while ((sa < GameData.SavedSceneData[LS][$r3].length)) {
    if ((GameData.SavedSceneData[LS][$r3][sa][0] == "Background")) {
      SwapBG(GameData.SavedSceneData[LS][$r3][sa][1]);
      $r11 = GameData.SavedSceneData[LS][$r3][sa][2].split(":");
      bg._x = Number($r11[0]);
      bg._y = Number($r11[1]);
      bg._xscale = Number($r11[2]);
      bg._yscale = Number($r11[3]);
      bg._rotation = Number($r11[4]);
      Dimmer._alpha = Number($r11[5]);
      GameData.Friction = Number($r11[6]);
      GameData.BGAutoScale = false;
      Interface.BGMenu.AScheck.gotoAndStop(1);
      if (bg.Anim) {
        bg.Anim.gotoAndPlay(Number($r11[8]));
      }
      Interface.BGMenu.lX.text = bg._x;
      Interface.BGMenu.lY.text = bg._y;
      Interface.BGMenu.sX.text = bg._xscale;
      Interface.BGMenu.rD.text = bg._rotation;
      Interface.BGMenu.Fr.text = (1 - GameData.Friction) * 100;
      Interface.BGMenu.Br.text = 100 - Dimmer._alpha;
    } else {
      if ((GameData.SavedSceneData[LS][$r3][sa][0] == "Character")) {
        $r10 = makeChar("dna-" + GameData.SavedSceneData[LS][$r3][sa][1]);
        $r12 = GameData.SavedSceneData[LS][$r3][sa][2].split(":");
        if (GameData.Settings.PinnedLoading.Check) {
          $r10.Pin = true;
        }
        $r10._x = Number($r12[0]);
        $r10._y = Number($r12[1]);
        $r10._rotation = Number($r12[2]);
        $r10.XFace = Number($r12[3]);
        $r10._xscale = $r10._xscale * Number($r12[3]);
        $r10.YFace = Number($r12[4]);
        $r10._yscale = $r10._yscale * Number($r12[4]);
      } else {
        if ((GameData.SavedSceneData[LS][$r3][sa][0] == "Object")) {
          $r7 = GameData.SavedSceneData[LS][$r3][sa][2].split(":");
          $r9 = new Object();
          $r9.X = Number($r7[0]);
          $r9.Y = Number($r7[1]);
          $r9.XFace = Number($r7[2]);
          $r9.YFace = Number($r7[3]);
          $r9.Name = $r7[4];
          $r9.Scale = Number($r7[5]);
          $r9.cFrame = Number($r7[6]);
          $r9.Rotation = Number($r7[7]);
          makeObject(GameData.SavedSceneData[LS][$r3][sa][1], $r9);
        } else {
          if ((GameData.SavedSceneData[LS][$r3][sa][0] == "Cluster")) {
            $r7 = GameData.SavedSceneData[LS][$r3][sa][2].split(":");
            $r4 = new Object();
            $r4.X = Number($r7[0]);
            $r4.Y = Number($r7[1]);
            $r4.XFace = Number($r7[2]);
            $r4.YFace = Number($r7[3]);
            $r4.cFrame = Number($r7[4]);
            $r4.Name = $r7[5];
            $r4.Rows = Number($r7[6]);
            $r4.Cols = Number($r7[7]);
            $r4.Spread = Number($r7[8]);
            $r4.Dist = Number($r7[9]);
            $r4.SDist = Number($r7[10]);
            $r4.Px = Number($r7[11]);
            $r4.Py = Number($r7[12]);
            $r4.Dir = $r7[13];
            $r4.Scale = Number($r7[14]);
            $r4.Spiral = Number($r7[15]);
            $r4.RMod = Number($r7[16]);
            $r4.Rotation = Number($r7[17]);
            makeCluster(Number(GameData.SavedSceneData[LS][$r3][sa][1]), $r4);
          } else {
            if ((GameData.SavedSceneData[LS][$r3][sa][0] == "Bubble")) {
              $r7 = GameData.SavedSceneData[LS][$r3][sa][2].split(":");
              $r5 = new Object();
              $r5.Name = $r7[0];
              $r5.Scale = Number($r7[1]);
              $r5.XScale = Number($r7[2]);
              $r5.YScale = Number($r7[3]);
              $r5.FontColor = $r7[4];
              $r5.X = Number($r7[5]);
              $r5.Y = Number($r7[6]);
              $r5.Rotation = Number($r7[7]);
              $r5.XFace = Number($r7[8]);
              $r5.YFace = Number($r7[9]);
              $r5.BX = Number($r7[10]);
              $r5.BY = Number($r7[11]);
              $r5.BRotation = Number($r7[12]);
              $r5.TX = Number($r7[13]);
              $r5.TY = Number($r7[14]);
              $r5.TRotation = Number($r7[15]);
              $r14 = $r7[16].split("//cln//");
              $r13 = $r14.join(":");
              $r5.MSG = $r13;
              $r5.FontType = $r7[17];
              makeSpeechBubble(Number(GameData.SavedSceneData[LS][$r3][sa][1]), $r5);
            } else {
              if ((GameData.SavedSceneData[LS][$r3][sa][0] == "Image")) {
                $r7 = GameData.SavedSceneData[LS][$r3][sa][2].split(":");
                $r8 = new Object();
                $r8.X = Number($r7[0]);
                $r8.Y = Number($r7[1]);
                $r8.XFace = Number($r7[2]);
                $r8.YFace = Number($r7[3]);
                $r8.Name = $r7[4];
                $r8.Scale = Number($r7[5]);
                $r8.Rotation = Number($r7[6]);
                $r8.colorMode = $r7[7];
                if (($r7[8] == "false")) {
                  $r8.Blur = false;
                } else {
                  $r8.Blur = true;
                }
                $r8.BlurX = Number($r7[9]);
                $r8.BlurY = Number($r7[10]);
                $r8.BlurQ = Number($r7[11]);
                makeImage(GameData.SavedSceneData[LS][$r3][sa][1], $r8);
              } else {
                if ((GameData.SavedSceneData[LS][$r3][sa][0] == "Rain")) {
                  $r7 = GameData.SavedSceneData[LS][$r3][sa][2].split(":");
                  $r6 = new Object();
                  $r6.X = Number($r7[0]);
                  $r6.Y = Number($r7[1]);
                  $r6.XFace = Number($r7[2]);
                  $r6.YFace = Number($r7[3]);
                  $r6.Name = $r7[4];
                  $r6.Scale = Number($r7[5]);
                  $r6.Qty = Number($r7[6]);
                  $r6.Rmin = Number($r7[7]);
                  $r6.Rmax = Number($r7[8]);
                  $r6.Xmin = Number($r7[9]);
                  $r6.Xmax = Number($r7[10]);
                  $r6.Ymin = Number($r7[11]);
                  $r6.Ymax = Number($r7[12]);
                  $r6.Px = Number($r7[13]);
                  $r6.Py = Number($r7[14]);
                  $r6.cFrame = Number($r7[15]);
                  makeRain(Number(GameData.SavedSceneData[LS][$r3][sa][1]), $r6);
                }
              }
            }
          }
        }
      }
    }
    sa = sa + 1;
  }
  GameData.CurrentScene.CurrentAct = actN;
  Interface.SceneFrame.bName.text = LS + " : Part " + (actN + 1);
  RefreshActList();
  if (GameData.TheaterMode) {
    GameData.TheaterMode;
  }
  if (!Interface._visible) {
    ClearClickHandlers();
  }
}
<?>[GameData.Menus.Functions] = "LoadScene";
function (S) {
  Sys("Scene Saved. New Part Added.", "MenuSelect");
  SaveCurrentScene();
  GameData.SavedSceneData[GameData.CurrentScene.Name].ActID = GameData.SavedSceneData[GameData.CurrentScene.Name].ActID + 1;
  $r1 = "Act" + GameData.SavedSceneData[GameData.CurrentScene.Name].ActID;
  GameData.CurrentScene.CurrentAct = GameData.CurrentScene.CurrentAct + 1;
  GameData.SavedSceneData[GameData.CurrentScene.Name].Acts.splice(GameData.CurrentScene.CurrentAct, 0, $r1);
  GameData.SavedSceneData[GameData.CurrentScene.Name][$r1] = new Array();
  SaveCurrentScene();
  Interface.SceneFrame.bName.text = GameData.CurrentScene.Name + " : Part " + (GameData.CurrentScene.CurrentAct + 1);
  RefreshActList();
}
<?>[GameData.Menus.Functions] = "MakeNewAct";
function (S) {
  Sys("Scene Saved.", "MenuSelect");
  SaveCurrentScene();
}
<?>[GameData.Menus.Functions] = "SaveScene";
function (S) {
  GameData.SavedChars.push([GameData.Characters[GameData.Target._name].Name, "dna-" + getDNA(GameData.Characters[GameData.Target._name])]);
  GameData.SavedChars.sort(Array.CASEINSENSITIVE);
  makeListMenu(Interface.SavedCharMenu, "SavedChars", 100, 100);
  PositionMenu(Interface.SavedCharMenu, "C", "C", 117, -238, Interface.MainMenu, Interface.MainMenu);
  Sys(GameData.Characters[GameData.Target._name].Name + " Saved.", "MenuSelect");
}
<?>[GameData.Menus.Functions] = "SaveChar";
function (S) {
  if (Key.isDown(16)) {
    $r1 = 0;
    while (($r1 < 9)) {
      Scramble(makeChar("dna-" + getDNA(GameData.Characters[GameData.Target._name])));
      $r1 = $r1 + 1;
    }
  } else {
    makeChar("dna-" + getDNA(GameData.Characters[GameData.Target._name]));
  }
}
<?>[GameData.Menus.Functions] = "DupeChar";
function (S) {
  S._parent._visible = false;
}
<?>[GameData.Menus.Functions] = "CloseWindow";
function (S) {
  Delete(GameData.Target);
  Interface.Level1Menu._visible = false;
}
<?>[GameData.Menus.Functions] = "Delete";
function (S) {
  GameData.Screenshots[GameData.Target._name].Greyscale = false;
  GameData.Screenshots[GameData.Target._name].Blur = false;
  GameData.Target.pic.filters = [colorfilter];
}
<?>[GameData.Menus.Functions] = "DefaultColor";
function (S) {
  if ((GameData.Screenshots[GameData.Target._name].ColorMode == "greyscale")) {
    GameData.Screenshots[GameData.Target._name].ColorMode = "normal";
  } else {
    GameData.Screenshots[GameData.Target._name].ColorMode = "greyscale";
  }
  applyFilters();
}
<?>[GameData.Menus.Functions] = "Greyscale";
function (S) {
  if ((GameData.Screenshots[GameData.Target._name].ColorMode == "inverse")) {
    GameData.Screenshots[GameData.Target._name].ColorMode = "normal";
  } else {
    GameData.Screenshots[GameData.Target._name].ColorMode = "inverse";
  }
  applyFilters();
}
<?>[GameData.Menus.Functions] = "InverseColors";
function (S) {
  if (GameData.Screenshots[GameData.Target._name].Blur) {
    GameData.Screenshots[GameData.Target._name].Blur = false;
  } else {
    GameData.Screenshots[GameData.Target._name].Blur = true;
  }
  applyFilters();
}
<?>[GameData.Menus.Functions] = "Blur";
function (S, T) {
  if ((T == "Blur")) {
    GameData.Screenshots[GameData.Target._name].BlurSettings.X = Number(S._parent.xI.text);
    GameData.Screenshots[GameData.Target._name].BlurSettings.Y = Number(S._parent.yI.text);
    GameData.Screenshots[GameData.Target._name].BlurSettings.Q = Number(S._parent.qI.text);
    GameData.Screenshots[GameData.Target._name].Blur = true;
  }
  applyFilters();
}
<?>[GameData.Menus.Functions] = "SetFilter";
function (S, T) {
  GameData.Screenshots[GameData.Target._name][T] = false;
  applyFilters();
}
<?>[GameData.Menus.Functions] = "ClearFilter";
function (S) {
  $r1 = new flash.filters.GlowFilter(102, 0.7, 9, 9, 3, 3, true, false);
  GameData.Target.pic.filters = new Array($r1);
}
<?>[GameData.Menus.Functions] = "Glow";
function (S, T) {
  OpenMenu(1, Interface.DNAMenu);
  Interface.DNAMenu.Title.text = "Import Image";
  Interface.DNAMenu.DNAdata.setNewTextFormat(GameData.TextFormats.FURL);
  Interface.DNAMenu.DNAdata.text = "Enter URL";
  Interface.DNAMenu.OK.bName.text = "Import";
  function () {
    SwapColor(MC.BG, "Buttons", 1);
    if (!(GameData.Origin == "Local")) {
      $r2 = GameData.Origin.length;
      $r3 = Interface.DNAMenu.DNAdata.text.substr(0, $r2);
      if (($r3 == GameData.Origin)) {
        makeImage(Interface.DNAMenu.DNAdata.text);
        CloseMenus(1);
      } else {
        GameData.Menus.Functions.OpenHelp();
        Interface.HelpWindow.BasicHelpMenu._visible = false;
        playSound("Pop");
        Interface.HelpWindow.Next._visible = true;
        SwapColor(this.BG, "Buttons", 1);
        Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Import;
        function () {
          resetHelp();
        }
        <?>[Interface.HelpWindow.Next] = "onRelease";
      }
    } else {
      makeImage(Interface.DNAMenu.DNAdata.text);
      CloseMenus(1);
    }
  }
  <?>[Interface.DNAMenu.OK] = "onRelease";
}
<?>[GameData.Menus.Functions] = "ImportImage";
function (S, T) {
  makeSpeechBubble(T);
}
<?>[GameData.Menus.Functions] = "MakeBubble";
function (S, T) {
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      RandomizeAll(stage[c]);
    }
  } else {
    RandomizeAll(GameData.Target);
  }
}
<?>[GameData.Menus.Functions] = "Randomize";
function (S, T) {
  if (GameData.Windows[T]) {
    GameData.Windows[T].Open();
  } else {
    OpenMenu(1, Interface[T]);
    OnLoadHandler(Interface[T]);
  }
}
<?>[GameData.Menus.Functions] = "OpenWindow";
function (S) {
  OpenMenu(1, Interface.GeneralOptions);
  OnLoadHandler(Interface.GeneralOptions);
}
<?>[GameData.Menus.Functions] = "GeneralOptions";
function (S) {
  OpenMenu(1, Interface.BubbleWindow, this.BG);
  Interface.BubbleWindow.gX.text = GameData.Target._x;
  Interface.BubbleWindow.gY.text = GameData.Target._y;
  Interface.BubbleWindow.gXs.text = GameData.Target._xscale;
  Interface.BubbleWindow.gYs.text = GameData.Target._yscale;
  Interface.BubbleWindow.gR.text = GameData.Target._rotation;
  Interface.BubbleWindow.bX.text = GameData.Target.Bubble._x;
  Interface.BubbleWindow.bY.text = GameData.Target.Bubble._y;
  Interface.BubbleWindow.bXs.text = GameData.Target.Bubble._xscale;
  Interface.BubbleWindow.bYs.text = GameData.Target.Bubble._yscale;
  Interface.BubbleWindow.bR.text = GameData.Target.Bubble._rotation;
  Interface.BubbleWindow.tX.text = GameData.Target.D._x;
  Interface.BubbleWindow.tY.text = GameData.Target.D._y;
  Interface.BubbleWindow.tR.text = GameData.Target.D._rotation;
}
<?>[GameData.Menus.Functions] = "BubbleOptions";
function (S) {
  CloseMenus(1);
  editBubble(GameData.Target);
}
<?>[GameData.Menus.Functions] = "SetText";
function (S, T) {
  $r1 = new TextFormat();
  $r1.font = T;
  GameData.Target.FontType = T;
  GameData.Target.D.setTextFormat($r1);
  GameData.Target.D.setNewTextFormat($r1);
}
<?>[GameData.Menus.Functions] = "SetFont";
function (S) {
  if ((GameData.TargetType == "Character")) {
    colorHex = "0x" + GameData.Parts.Hair[GameData.Characters[GameData.Target._name].headFrame][6];
    GameData.Characters[GameData.Target._name].HairColor = colorHex;
    ColorPalette(GameData.Target.head.HairColor, colorHex);
    ColorPalette(Interface.TargetFrame.preview.char.hair.HairColor, colorHex);
    ColorPalette(GameData.Target.head2.HairColor, colorHex);
    ColorPalette(Interface.TargetFrame.preview.char.head2.HairColor, colorHex);
  } else {
    if ((GameData.TargetType == "SpeechBubble")) {
      colorHex = "0x000000";
      $r1 = new TextFormat();
      $r1.color = colorHex;
      GameData.Target.D.setTextFormat($r1);
      GameData.Target.D.setNewTextFormat($r1);
    }
  }
  ColorPalette(Interface.ColorizeMenu.palette.Cp.BG, colorHex);
  Interface.ColorizeMenu.palette.Rs._x = toRGB(colorHex.charAt(2)) * 16 + toRGB(colorHex.charAt(3));
  Interface.ColorizeMenu.palette.Gs._x = toRGB(colorHex.charAt(4)) * 16 + toRGB(colorHex.charAt(5));
  Interface.ColorizeMenu.palette.Bs._x = toRGB(colorHex.charAt(6)) * 16 + toRGB(colorHex.charAt(7));
}
<?>[GameData.Menus.Functions] = "SetDefaultColor";
function (S) {
  Interface.ColorizeMenu.palette.Rs._x = random(256);
  Interface.ColorizeMenu.palette.Gs._x = random(256);
  Interface.ColorizeMenu.palette.Bs._x = random(256);
  SwapPalette(Interface.ColorizeMenu.palette);
}
<?>[GameData.Menus.Functions] = "SetRandomColor";
function (S) {
  colorHex = GameData.Characters[GameData.Target._name].HairColor;
  ColorPalette(Interface.ColorizeMenu.palette.Cp.BG, colorHex);
  Interface.ColorizeMenu.palette.Rs._x = toRGB(colorHex.charAt(2)) * 16 + toRGB(colorHex.charAt(3));
  Interface.ColorizeMenu.palette.Gs._x = toRGB(colorHex.charAt(4)) * 16 + toRGB(colorHex.charAt(5));
  Interface.ColorizeMenu.palette.Bs._x = toRGB(colorHex.charAt(6)) * 16 + toRGB(colorHex.charAt(7));
  OpenMenu(1, Interface.ColorizeMenu);
  OnLoadHandler(Interface.ColorizeMenu);
}
<?>[GameData.Menus.Functions] = "ColorizeMenu";
function (S) {
  if ((GameData.Clusters[GameData.Target._name].Dir == "Out")) {
    GameData.Clusters[GameData.Target._name].Dir = "In";
    S.bName.text = "In";
  } else {
    if ((GameData.Clusters[GameData.Target._name].Dir == "In")) {
      GameData.Clusters[GameData.Target._name].Dir = "Linear";
      S.bName.text = "Linear";
    } else {
      if ((GameData.Clusters[GameData.Target._name].Dir == "Linear")) {
        GameData.Clusters[GameData.Target._name].Dir = "Random";
        S.bName.text = "Random";
      } else {
        GameData.Clusters[GameData.Target._name].Dir = "Out";
        S.bName.text = "Out";
      }
    }
  }
  fixCluster(GameData.Target);
  OnLoadHandler(Interface.ClusterOptions);
}
<?>[GameData.Menus.Functions] = "ClusterDir";
function (S) {
  if (Interface.LockMenu._visible) {
    CloseMenus(2);
    SwapColor(S.BG, "Buttons", 1);
  } else {
    checkLocks(GameData.Characters[GameData.Target._name], Interface.LockMenu);
    OpenMenu(2, Interface.LockMenu, this.BG);
    SwapColor(S.BG, "Buttons", 2);
  }
}
<?>[GameData.Menus.Functions] = "LocksMenu";
function (S) {
  $r2 = GameData.Objects[GameData.Target._name].Scale;
  $r1 = makeCluster(GameData.Objects[GameData.Target._name].Type);
  $r1._xscale = $r2;
  $r1._yscale = $r2;
  GameData.Clusters[$r1._name].Scale = $r2;
  Delete(GameData.Target);
  Target($r1);
}
<?>[GameData.Menus.Functions] = "Clusterize";
function (S) {
  $r2 = GameData.Objects[GameData.Target._name].Scale;
  $r1 = makeRain(GameData.Objects[GameData.Target._name].Type);
  $r1._xscale = $r2;
  $r1._yscale = $r2;
  GameData.Rain[$r1._name].Scale = $r2;
  Delete(GameData.Target);
  Target($r1);
}
<?>[GameData.Menus.Functions] = "TurnIntoRain";
function (S) {
  openCOMenu();
}
<?>[GameData.Menus.Functions] = "CharOptions";
function (S) {
  showDNAstrand(GameData.Characters[GameData.Target._name]);
}
<?>[GameData.Menus.Functions] = "ShowTargetDNA";
function (S) {
  BringToFront(GameData.Target);
}
<?>[GameData.Menus.Functions] = "BringToFront";
function (S) {
  BringForward(GameData.Target);
}
<?>[GameData.Menus.Functions] = "BringForward";
function (S) {
  SendBackward(GameData.Target);
}
<?>[GameData.Menus.Functions] = "SendBackward";
function (S) {
  SendToBack(GameData.Target);
}
<?>[GameData.Menus.Functions] = "SendToBack";
function (S) {
  VFlip();
}
<?>[GameData.Menus.Functions] = "VerticalFlip";
function (S) {
  HFlip();
}
<?>[GameData.Menus.Functions] = "HorizontalFlip";
function (S) {
  if (Interface.RenameMenu._visible) {
    CloseMenus(3);
    SwapColor(this.BG, "Buttons", 1);
  } else {
    resetRenameMenu();
    $r2 = new TextFormat();
    $r2.font = "Wild Words";
    Interface.RenameMenu.iName.setNewTextFormat($r2);
    if ((GameData.TargetType == "Character")) {
      Interface.RenameMenu.iName.text = GameData.Characters[GameData.Target._name].Name;
    } else {
      if ((GameData.TargetType == "Object")) {
        Interface.RenameMenu.iName.text = GameData.Objects[GameData.Target._name].Name;
      } else {
        if ((GameData.TargetType == "SpeechBubble")) {
          Interface.RenameMenu.iName.text = GameData.SpeechBubbles[GameData.Target._name].Name;
        } else {
          if ((GameData.TargetType == "Screenshot")) {
            Interface.RenameMenu.iName.text = GameData.Screenshots[GameData.Target._name].Name;
          }
        }
      }
    }
    Selection.setFocus(Interface.RenameMenu.iName);
    OpenMenu(3, Interface.RenameMenu, this.BG);
    SwapColor(this.BG, "Buttons", 2);
  }
}
<?>[GameData.Menus.Functions] = "Rename";
function (S) {
  if ((S.bName.text == "Mouth")) {
    $r3 = Interface.MouthMenu;
  } else {
    if ((S.bName.text == "Eyes")) {
      $r3 = Interface.EyesMenu;
    } else {
      if ((S.bName.text == "Hair")) {
        $r3 = Interface.HairMenu;
      } else {
        if ((S.bName.text == "Body")) {
          $r3 = Interface.BodyMenu;
        } else {
          if ((S.bName.text == "Arms")) {
            $r3 = Interface.ArmsMenu;
          } else {
            if ((S.bName.text == "Shoes")) {
              $r3 = Interface.ShoesMenu;
            } else {
              if ((S.bName.text == "Back")) {
                $r3 = Interface.BackMenu;
              } else {
                if ((S.bName.text == "Accessory")) {
                  $r3 = Interface.AccMenu;
                } else {
                  if ((S.bName.text == "Items")) {
                    $r3 = Interface.ItemMenu;
                  } else {
                    if ((S.bName.text == "Hat")) {
                      $r3 = Interface.HatMenu;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (!GameData.Locks[S.bName.text]) {
    GameData.Locks[S.bName.text];
  }
  if (GameData.Characters[GameData.Target._name].Locks[S.bName.text]) {
    OpenMenu(3, Interface.HelpWindow, this);
    resetHelp();
    Interface.HelpWindow.BasicHelpMenu._visible = false;
    Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Locks;
    Interface.HelpWindow.Next._visible = true;
    function () {
      Interface.HelpWindow._visible = false;
    }
    <?>[Interface.HelpWindow.Next] = "onRelease";
  } else {
    if ($r3._visible) {
      CloseMenus(3);
      SwapColor(S.BG, "Buttons", 1);
    } else {
      $r3._x = S._parent._x + 210;
      OpenMenu(3, $r3, S);
      SwapColor(S.BG, "Buttons", 2);
    }
  }
}
<?>[GameData.Menus.Functions] = "PartsList";
function (S) {
  if (Interface.HelpWindow._visible) {
    CloseMenus(2);
    SwapColor(S.BG, "Buttons", 1);
  } else {
    resetHelp();
    CloseMenus(1);
    OpenMenu(2, Interface.HelpWindow, S);
    SwapColor(S.BG, "Buttons", 2);
  }
}
<?>[GameData.Menus.Functions] = "OpenHelp";
function (S) {
  makeChar();
}
<?>[GameData.Menus.Functions] = "NewChar";
function (S, T, L) {
  if (GameData.Menus[T]) {
    SetMenu(L, T, S, S._parent._x, S._parent._y);
  } else {
    $r4 = Interface[T];
    $r4._x = S._parent._x + 110;
    NewOpenMenu(S, $r4, L);
    if ((T == "SceneActMenu")) {
      $r2 = GameData.SceneActs.length;
      if (($r2 > 11)) {
        $r2 = 11;
      }
      Interface.SceneActMenu._y = -155 + 20 * $r2;
    }
  }
}
<?>[GameData.Menus.Functions] = "OpenMenu";
function (S, T) {
  if (!(T == "Characters")) {
    T == "Characters";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      if ((GameData.Characters[c].Scale > 40)) {
        GameData.Characters[c].Scale = 40;
        stage[c]._xscale = 40 * stage[c].XFace;
        stage[c]._yscale = 40 * stage[c].YFace;
      }
    }
  }
  if (!(T == "Objects")) {
    T == "Objects";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      if ((GameData.Objects[c].Scale > 40)) {
        GameData.Objects[c].Scale = 40;
        stage[c]._xscale = 40 * stage[c].XFace;
        stage[c]._yscale = 40 * stage[c].YFace;
      }
    }
  }
  if (!(T == "Bubbles")) {
    T == "Bubbles";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      if ((GameData.SpeechBubbles[c].Scale > 40)) {
        GameData.SpeechBubbles[c].Scale = 40;
        stage[c]._xscale = 40 * stage[c].XFace;
        stage[c]._yscale = 40 * stage[c].YFace;
      }
    }
  }
  if (!(T == "Screenshots")) {
    T == "Screenshots";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      if ((GameData.Screenshots[c].Scale > 40)) {
        GameData.Screenshots[c].Scale = 40;
        stage[c]._xscale = 40 * stage[c].XFace;
        stage[c]._yscale = 40 * stage[c].YFace;
      }
    }
  }
}
<?>[GameData.Menus.Functions] = "Shrink";
function (S, T) {
  if (!(T == "Characters")) {
    T == "Characters";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      Delete(stage[c]);
    }
  }
  if (!(T == "Clusters")) {
    T == "Clusters";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      Delete(stage[c]);
    }
  }
  if (!(T == "Objects")) {
    T == "Objects";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      Delete(stage[c]);
    }
  }
  if (!(T == "Bubbles")) {
    T == "Bubbles";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      Delete(stage[c]);
    }
  }
  if (!(T == "Rain")) {
    T == "Rain";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      Delete(stage[c]);
    }
  }
  if (!(T == "Screenshots")) {
    T == "Screenshots";
  }
  if ((T == "All")) {
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      Delete(stage[c]);
    }
  }
  if (!(T == "BG")) {
    T == "BG";
  }
  if ((T == "All")) {
    SwapBG(0);
  }
}
<?>[GameData.Menus.Functions] = "Clear";
function (S) {
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    c = $r0;
    Scramble(stage[c]);
  }
}
<?>[GameData.Menus.Functions] = "Scramble";
function (S, T) {
  if (stage[T]._visible) {
    Delete(stage[T]);
  } else {
    GameData.Depths.StageList.push({Depth: stage[T].getDepth(), Type: "Toys", Name: T});
    GameData.Depths.StageList.sortOn("Depth", Array.DESCENDING | Array.NUMERIC);
    stage[T]._visible = true;
    if ((T == "GravityWell")) {
      SendToBack(stage[T]);
    } else {
      if (!(T == "Mysterious Gap")) {
        BringToFront(stage[T]);
      }
    }
  }
}
<?>[GameData.Menus.Functions] = "ShowToy";
function (T) {
  function () {
    GameData.Target._x = Number(this.text);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isXLoc";
function (T) {
  function () {
    GameData.Target._y = Number(this.text);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isYLoc";
function (T) {
  function () {
    GameData.Target._rotation = Number(this.text);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRotation";
function (T) {
  function () {
    GameData.Target._alpha = Number(this.text);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isAlpha";
function (T) {
  function () {
    if ((Number(this.text) < GameData.ScaleLimit)) {
      this.text = GameData.ScaleLimit;
    }
    GameData[getArray()][GameData.Target._name].Scale = Number(this.text);
    GameData.Target._xscale = Number(this.text) * GameData.Target.XFace;
    GameData.Target._yscale = Number(this.text) * GameData.Target.YFace;
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isScale";
function (T) {
  function () {
    if ((Number(this.text) < GameData.ScaleLimit)) {
      this.text = GameData.ScaleLimit;
    }
    GameData[getArray()][GameData.Target._name].Scale = Number(this.text);
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      d = $r0;
      fixDropScale(GameData.Target[d]);
    }
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRScale";
function (T) {
  function () {
    GameData.Rain[GameData.Target._name].Qty = Number(this.text);
    fixRain(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRDensity";
function (T) {
  function () {
    GameData.Clusters[GameData.Target._name].Rows = Number(this.text);
    fixCluster(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isClusterRows";
function (T) {
  function () {
    GameData.Clusters[GameData.Target._name].Cols = Number(this.text);
    fixCluster(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isClusterCols";
function (T) {
  function () {
    GameData.Clusters[GameData.Target._name].Distance = Number(this.text);
    fixCluster(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isClusterDist";
function (T) {
  function () {
    GameData.Clusters[GameData.Target._name].Spiral = Number(this.text);
    fixCluster(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isClusterSpiral";
function (T) {
  function () {
    GameData.Clusters[GameData.Target._name].Spread = Number(this.text);
    fixCluster(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isClusterSpread";
function (T) {
  function () {
    GameData.Clusters[GameData.Target._name].RMod = Number(this.text);
    fixCluster(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isClusterRMod";
function (T) {
  function () {
    GameData.Clusters[GameData.Target._name].StartDist = Number(this.text);
    fixCluster(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isClusterSD";
function (T) {
  function () {
    GameData.Rain[GameData.Target._name].Rmin = Number(this.text);
    if ((Number(this.text) > GameData.Rain[GameData.Target._name].Rmax)) {
      GameData.Rain[GameData.Target._name].Rmax = Number(this.text);
      this._parent.tmaxI.text = this.text;
    }
    fixRain(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRTwirlMin";
function (T) {
  function () {
    GameData.Rain[GameData.Target._name].Rmax = Number(this.text);
    if ((GameData.Rain[GameData.Target._name].Rmin > Number(this.text))) {
      GameData.Rain[GameData.Target._name].Rmin = Number(this.text);
      this._parent.tminI.text = this.text;
    }
    fixRain(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRTwirlMax";
function (T) {
  function () {
    GameData.Rain[GameData.Target._name].Xmin = Number(this.text);
    if ((Number(this.text) > GameData.Rain[GameData.Target._name].Xmax)) {
      GameData.Rain[GameData.Target._name].Xmax = Number(this.text);
      this._parent.xmaxI.text = this.text;
    }
    fixRain(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRXMin";
function (T) {
  function () {
    GameData.Rain[GameData.Target._name].Xmax = Number(this.text);
    if ((GameData.Rain[GameData.Target._name].Xmin > Number(this.text))) {
      GameData.Rain[GameData.Target._name].Xmin = Number(this.text);
      this._parent.xminI.text = this.text;
    }
    fixRain(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRXMax";
function (T) {
  function () {
    GameData.Rain[GameData.Target._name].Ymin = Number(this.text);
    if ((Number(this.text) > GameData.Rain[GameData.Target._name].Ymax)) {
      GameData.Rain[GameData.Target._name].Ymax = Number(this.text);
      this._parent.ymaxI.text = this.text;
    }
    fixRain(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRYMin";
function (T) {
  function () {
    GameData.Rain[GameData.Target._name].Ymax = Number(this.text);
    if ((GameData.Rain[GameData.Target._name].Ymin > Number(this.text))) {
      GameData.Rain[GameData.Target._name].Ymin = Number(this.text);
      this._parent.yminI.text = this.text;
    }
    fixRain(GameData.Target);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRYMax";
function (T) {
  function () {
    colorHex = "0x" + this.text;
    Interface.ColorizeMenu.palette.Rs._x = toRGB(colorHex.charAt(2)) * 16 + toRGB(colorHex.charAt(3));
    Interface.ColorizeMenu.palette.Gs._x = toRGB(colorHex.charAt(4)) * 16 + toRGB(colorHex.charAt(5));
    Interface.ColorizeMenu.palette.Bs._x = toRGB(colorHex.charAt(6)) * 16 + toRGB(colorHex.charAt(7));
    SwapPalette(Interface.ColorizeMenu.palette);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isRGB";
function (T) {
  function () {
    GameData.CurrentScene.Name = this.text.toLowerCase();
    Interface.SceneFrame.bName.text = GameData.CurrentScene.Name + " : Part " + (GameData.CurrentScene.CurrentAct + 1);
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isSceneName";
function (T) {
  function () {
    GameData.CurrentScene.Prev = this.text.toLowerCase();
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isPrevScene";
function (T) {
  function () {
    GameData.CurrentScene.Next = this.text.toLowerCase();
    GameData.KeyLock = false;
  }
  <?>[T] = "onKillFocus";
}
<?>[GameData.Menus.OnSetFocus] = "isNextScene";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.CurrentScene.Name;
}
<?>[GameData.Menus.OnLoad] = "isSceneName";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.CurrentScene.Prev;
}
<?>[GameData.Menus.OnLoad] = "isPrevScene";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.CurrentScene.Next;
}
<?>[GameData.Menus.OnLoad] = "isNextScene";
function (MC, i) {
  if (GameData.CurrentScene.ClearStage) {
    MC[MC.OnLoad[i][0]].gotoAndStop(2);
  } else {
    MC[MC.OnLoad[i][0]].gotoAndStop(1);
  }
}
<?>[GameData.Menus.OnLoad] = "cStageCheck";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Target._x;
}
<?>[GameData.Menus.OnLoad] = "isXLoc";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Target._y;
}
<?>[GameData.Menus.OnLoad] = "isYLoc";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData[getArray()][GameData.Target._name].Scale;
}
<?>[GameData.Menus.OnLoad] = "isScale";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Target._rotation;
}
<?>[GameData.Menus.OnLoad] = "isRotation";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Target._alpha;
}
<?>[GameData.Menus.OnLoad] = "isAlpha";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Clusters[GameData.Target._name].Rows;
}
<?>[GameData.Menus.OnLoad] = "isClusterRows";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Clusters[GameData.Target._name].Cols;
}
<?>[GameData.Menus.OnLoad] = "isClusterCols";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Clusters[GameData.Target._name].Distance;
}
<?>[GameData.Menus.OnLoad] = "isClusterDist";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Clusters[GameData.Target._name].Spiral;
}
<?>[GameData.Menus.OnLoad] = "isClusterSpiral";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Clusters[GameData.Target._name].Spread;
}
<?>[GameData.Menus.OnLoad] = "isClusterSpread";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Clusters[GameData.Target._name].RMod;
}
<?>[GameData.Menus.OnLoad] = "isClusterRMod";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Clusters[GameData.Target._name].StartDist;
}
<?>[GameData.Menus.OnLoad] = "isClusterSD";
function (MC, i) {
  if (GameData.Clusters[GameData.Target._name].TowardsPoint) {
    MC[MC.OnLoad[i][0]].gotoAndStop(2);
  } else {
    MC[MC.OnLoad[i][0]].gotoAndStop(1);
  }
}
<?>[GameData.Menus.OnLoad] = "ClusterPoint";
function (MC, i) {
  MC[MC.OnLoad[i][0]].bName.text = GameData.Clusters[GameData.Target._name].Dir;
}
<?>[GameData.Menus.OnLoad] = "isClusterDir";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Rain[GameData.Target._name].Qty;
}
<?>[GameData.Menus.OnLoad] = "isRDensity";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Rain[GameData.Target._name].Rmin;
}
<?>[GameData.Menus.OnLoad] = "isRTwirlMin";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Rain[GameData.Target._name].Rmax;
}
<?>[GameData.Menus.OnLoad] = "isRTwirlMax";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Rain[GameData.Target._name].Xmin;
}
<?>[GameData.Menus.OnLoad] = "isRXMin";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Rain[GameData.Target._name].Xmax;
}
<?>[GameData.Menus.OnLoad] = "isRXMax";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Rain[GameData.Target._name].Ymin;
}
<?>[GameData.Menus.OnLoad] = "isRYMin";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Rain[GameData.Target._name].Ymax;
}
<?>[GameData.Menus.OnLoad] = "isRYMax";
function (MC, i) {
  if ((GameData.TargetType == "Character")) {
    MC[MC.OnLoad[i][0]].text = GameData.Characters[GameData.Target._name].HairColor.substr(2, 6);
  } else {
    if ((GameData.TargetType == "SpeechBubble")) {
      MC[MC.OnLoad[i][0]].text = GameData.SpeechBubbles[GameData.Target._name].FontColor.substr(2, 6);
    }
  }
}
<?>[GameData.Menus.OnLoad] = "isRGB";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Screenshots[GameData.Target._name].BlurSettings.X;
}
<?>[GameData.Menus.OnLoad] = "isBlurX";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Screenshots[GameData.Target._name].BlurSettings.Y;
}
<?>[GameData.Menus.OnLoad] = "isBlurY";
function (MC, i) {
  MC[MC.OnLoad[i][0]].text = GameData.Screenshots[GameData.Target._name].BlurSettings.Q;
}
<?>[GameData.Menus.OnLoad] = "isBlurQ";
function () {
  if (GameData.Settings.UntargetablePinned.Check) {
    ClearClickHandlers();
  } else {
    SetClickHandlers();
  }
}
<?>[GameData.Settings.UntargetablePinned] = "Trigger";
GameData.Menus.Max = 4;
GameData.Menus.AutoScale = true;
GameData.Menus.DMax = 0;
GameData.Menus.Size = 100;
GameData.Menus.Targets = new Object();
GameData.Menus.MainMenu = new Object();
GameData.Menus.MainMenu.Size = 140;
GameData.Menus.MainMenu.XMod = 0;
GameData.Menus.MainMenu.YMod = 0;
GameData.Menus.MainMenu.Items = new Array();
AddMenuItem("MainMenu", "Options", "OpenWindow-Options");
AddMenuItem("MainMenu", "Insert", "Open-InsertMenu-2");
AddMenuItem("MainMenu", "Global Locks", "Open-GlobalLockMenu-2");
AddMenuItem("MainMenu", "Stage", "Open-StageMenu-2");
AddMenuItem("MainMenu", "Background", "Open-BGMenu-2");
AddMenuItem("MainMenu", "Toys", "Open-ToyMenu-2");
AddMenuItem("MainMenu", "Load Preset", "Open-PresetMenu-2");
AddMenuItem("MainMenu", "New Character", "NewChar");
AddMenuItem("MainMenu", "File", "Open-FileMenu-2");
AddMenuItem("MainMenu", "Help Me Eirin!", "OpenHelp");
GameData.Menus.SceneMenu = new Object();
GameData.Menus.SceneMenu.Size = 140;
GameData.Menus.SceneMenu.XMod = 20;
GameData.Menus.SceneMenu.YMod = 120;
GameData.Menus.SceneMenu.Items = new Array();
AddMenuItem("SceneMenu", "Scene Info", "OpenWindow-SceneSettings");
AddMenuItem("SceneMenu", "Save Scene", "SaveScene");
AddMenuItem("SceneMenu", "Parts", "Open-SceneActMenu-3");
AddMenuItem("SceneMenu", "New Part", "MakeNewAct");
AddMenuItem("SceneMenu", "Clear Stage", "Clear-All");
GameData.Menus.FileMenu = new Object();
GameData.Menus.FileMenu.Size = 140;
GameData.Menus.FileMenu.XMod = 140;
GameData.Menus.FileMenu.YMod = 20;
GameData.Menus.FileMenu.Items = new Array();
AddMenuItem("FileMenu", "Characters", "Open-SavedCharMenu-3");
AddMenuItem("FileMenu", "Scene Info", "OpenWindow-SceneSettings");
AddMenuItem("FileMenu", "Save Scene", "SaveScene");
AddMenuItem("FileMenu", "Open Scene", "Open-SavedSceneMenu-3");
GameData.Menus.CharacterMenu = new Object();
GameData.Menus.CharacterMenu.Size = 140;
GameData.Menus.CharacterMenu.XMod = 0;
GameData.Menus.CharacterMenu.YMod = 0;
GameData.Menus.CharacterMenu.Items = new Array();
AddMenuItem("CharacterMenu", "Save", "SaveChar");
AddMenuItem("CharacterMenu", "Show DNA", "ShowTargetDNA");
AddMenuItem("CharacterMenu", "Options", "CharOptions");
AddMenuItem("CharacterMenu", "Duplicate", "DupeChar");
AddMenuItem("CharacterMenu", "Colorize", "ColorizeMenu");
AddMenuItem("CharacterMenu", "Lock Parts", "LocksMenu");
AddMenuItem("CharacterMenu", "Change Parts", "Open-PartsMenu-2");
AddMenuItem("CharacterMenu", "Edit", "Open-EditMenu-2");
AddMenuItem("CharacterMenu", "Randomize", "Randomize");
AddMenuItem("CharacterMenu", "Delete", "Delete");
GameData.Menus.ObjectMenu = new Object();
GameData.Menus.ObjectMenu.Size = 140;
GameData.Menus.ObjectMenu.XMod = 0;
GameData.Menus.ObjectMenu.YMod = 0;
GameData.Menus.ObjectMenu.Items = new Array();
AddMenuItem("ObjectMenu", "Options", "OpenWindow-GeneralOptions");
AddMenuItem("ObjectMenu", "Clusterize", "Clusterize");
AddMenuItem("ObjectMenu", "Rain!", "TurnIntoRain");
AddMenuItem("ObjectMenu", "Edit", "Open-EditMenu-2");
AddMenuItem("ObjectMenu", "Delete", "Delete");
GameData.Menus.RainMenu = new Object();
GameData.Menus.RainMenu.Size = 140;
GameData.Menus.RainMenu.XMod = 0;
GameData.Menus.RainMenu.YMod = 0;
GameData.Menus.RainMenu.Items = new Array();
AddMenuItem("RainMenu", "Options", "OpenWindow-RainOptions");
AddMenuItem("RainMenu", "Edit", "Open-EditMenu-2");
AddMenuItem("RainMenu", "Delete", "Delete");
GameData.Menus.SSMenu = new Object();
GameData.Menus.SSMenu.Size = 140;
GameData.Menus.SSMenu.XMod = 0;
GameData.Menus.SSMenu.YMod = 0;
GameData.Menus.SSMenu.Items = new Array();
AddMenuItem("SSMenu", "Options", "OpenWindow-SnapshotOptions");
AddMenuItem("SSMenu", "Filters", "Open-FilterMenu-2");
AddMenuItem("SSMenu", "Edit", "Open-EditMenu-2");
AddMenuItem("SSMenu", "Delete", "Delete");
GameData.Menus.FilterMenu = new Object();
GameData.Menus.FilterMenu.Size = 140;
GameData.Menus.FilterMenu.XMod = 140;
GameData.Menus.FilterMenu.YMod = 40;
GameData.Menus.FilterMenu.Items = new Array();
AddMenuItem("FilterMenu", "Reset", "DefaultColor");
AddMenuItem("FilterMenu", "Greyscale", "Greyscale");
AddMenuItem("FilterMenu", "Inverse Colors", "InverseColors");
AddMenuItem("FilterMenu", "Blur", "OpenWindow-BlurSettings");
GameData.Menus.ClusterMenu = new Object();
GameData.Menus.ClusterMenu.Size = 140;
GameData.Menus.ClusterMenu.XMod = 0;
GameData.Menus.ClusterMenu.YMod = 0;
GameData.Menus.ClusterMenu.Items = new Array();
AddMenuItem("ClusterMenu", "Options", "OpenWindow-ClusterOptions");
AddMenuItem("ClusterMenu", "Edit", "Open-EditMenu-2");
AddMenuItem("ClusterMenu", "Delete", "Delete");
GameData.Menus.BubbleMenu = new Object();
GameData.Menus.BubbleMenu.Size = 140;
GameData.Menus.BubbleMenu.XMod = 0;
GameData.Menus.BubbleMenu.YMod = 0;
GameData.Menus.BubbleMenu.Items = new Array();
AddMenuItem("BubbleMenu", "Options", "BubbleOptions");
AddMenuItem("BubbleMenu", "Colorize", "ColorizeMenu");
AddMenuItem("BubbleMenu", "Set Font", "Open-FontMenu-2");
AddMenuItem("BubbleMenu", "Edit", "Open-EditMenu-2");
AddMenuItem("BubbleMenu", "Set Text", "SetText");
AddMenuItem("BubbleMenu", "Delete", "Delete");
GameData.Menus.FontMenu = new Object();
GameData.Menus.FontMenu.Size = 140;
GameData.Menus.FontMenu.XMod = 140;
GameData.Menus.FontMenu.YMod = 40;
GameData.Menus.FontMenu.Items = new Array();
AddMenuItem("FontMenu", "Arial", "SetFont-Arial");
AddMenuItem("FontMenu", "Brankovic", "SetFont-Brankovic");
AddMenuItem("FontMenu", "Geek a byte", "SetFont-Geek a byte");
AddMenuItem("FontMenu", "GungsuhChe", "SetFont-GungsuhChe");
AddMenuItem("FontMenu", "MS UI Gothic", "SetFont-MS UI Gothic");
AddMenuItem("FontMenu", "Necropsy", "SetFont-Necropsy");
AddMenuItem("FontMenu", "Wild Words", "SetFont-Wild Words");
AddMenuItem("FontMenu", "Wingdings", "SetFont-Wingdings");
GameData.Menus.EditMenu = new Object();
GameData.Menus.EditMenu.Size = 140;
GameData.Menus.EditMenu.XMod = 140;
GameData.Menus.EditMenu.YMod = 40;
GameData.Menus.EditMenu.Items = new Array();
AddMenuItem("EditMenu", "Rename", "Rename");
AddMenuItem("EditMenu", "Horizontal Flip", "HorizontalFlip");
AddMenuItem("EditMenu", "Vertical Flip", "VerticalFlip");
AddMenuItem("EditMenu", "Send to Back", "SendToBack");
AddMenuItem("EditMenu", "Send Backward", "SendBackward");
AddMenuItem("EditMenu", "Bring Forward", "BringForward");
AddMenuItem("EditMenu", "Bring to Front", "BringToFront");
GameData.Menus.PartsMenu = new Object();
GameData.Menus.PartsMenu.Size = 100;
GameData.Menus.PartsMenu.XMod = -100;
GameData.Menus.PartsMenu.YMod = 40;
GameData.Menus.PartsMenu.Items = new Array();
AddMenuItem("PartsMenu", "Mouth", "PartsList");
AddMenuItem("PartsMenu", "Eyes", "PartsList");
AddMenuItem("PartsMenu", "Hair", "PartsList");
AddMenuItem("PartsMenu", "Body", "PartsList");
AddMenuItem("PartsMenu", "Arms", "PartsList");
AddMenuItem("PartsMenu", "Shoes", "PartsList");
AddMenuItem("PartsMenu", "Back", "PartsList");
AddMenuItem("PartsMenu", "Accessory", "PartsList");
AddMenuItem("PartsMenu", "Items", "PartsList");
AddMenuItem("PartsMenu", "Hat", "PartsList");
GameData.Menus.StageMenu = new Object();
GameData.Menus.StageMenu.Size = 140;
GameData.Menus.StageMenu.XMod = 140;
GameData.Menus.StageMenu.YMod = 40;
GameData.Menus.StageMenu.Items = new Array();
AddMenuItem("StageMenu", "Clear", "Open-ClearMenu-3");
AddMenuItem("StageMenu", "Randomize All", "Randomize-All");
AddMenuItem("StageMenu", "Scramble!", "Scramble");
AddMenuItem("StageMenu", "Shrink", "Open-ShrinkMenu-3");
GameData.Menus.ShrinkMenu = new Object();
GameData.Menus.ShrinkMenu.Size = 140;
GameData.Menus.ShrinkMenu.XMod = 140;
GameData.Menus.ShrinkMenu.YMod = 40;
GameData.Menus.ShrinkMenu.Items = new Array();
AddMenuItem("ShrinkMenu", "Characters", "Shrink-Characters");
AddMenuItem("ShrinkMenu", "Objects", "Shrink-Objects");
AddMenuItem("ShrinkMenu", "Bubbles", "Shrink-Bubbles");
AddMenuItem("ShrinkMenu", "Screenshots", "Shrink-Screenshots");
AddMenuItem("ShrinkMenu", "Everything", "Shrink-All");
GameData.Menus.ClearMenu = new Object();
GameData.Menus.ClearMenu.Size = 140;
GameData.Menus.ClearMenu.XMod = 140;
GameData.Menus.ClearMenu.YMod = 100;
GameData.Menus.ClearMenu.Items = new Array();
AddMenuItem("ClearMenu", "Characters", "Clear-Characters");
AddMenuItem("ClearMenu", "Clusters", "Clear-Clusters");
AddMenuItem("ClearMenu", "Objects", "Clear-Objects");
AddMenuItem("ClearMenu", "Bubbles", "Clear-Bubbles");
AddMenuItem("ClearMenu", "Rain", "Clear-Rain");
AddMenuItem("ClearMenu", "Screenshots", "Clear-Screenshots");
AddMenuItem("ClearMenu", "Background", "Clear-BG");
AddMenuItem("ClearMenu", "Everything", "Clear-All");
GameData.Menus.InsertMenu = new Object();
GameData.Menus.InsertMenu.Size = 140;
GameData.Menus.InsertMenu.XMod = 140;
GameData.Menus.InsertMenu.YMod = 40;
GameData.Menus.InsertMenu.Items = new Array();
AddMenuItem("InsertMenu", "Object", "Open-ObjectList-3");
AddMenuItem("InsertMenu", "Bubble", "Open-makeBubbleMenu-3");
AddMenuItem("InsertMenu", "Image", "ImportImage");
GameData.Menus.makeBubbleMenu = new Object();
GameData.Menus.makeBubbleMenu.Size = 140;
GameData.Menus.makeBubbleMenu.XMod = 140;
GameData.Menus.makeBubbleMenu.YMod = 40;
GameData.Menus.makeBubbleMenu.Items = new Array();
AddMenuItem("makeBubbleMenu", "Speech", "MakeBubble-1");
AddMenuItem("makeBubbleMenu", "Thought", "MakeBubble-2");
AddMenuItem("makeBubbleMenu", "Box", "MakeBubble-3");
AddMenuItem("makeBubbleMenu", "Floating", "MakeBubble-4");
AddMenuItem("makeBubbleMenu", "Action", "MakeBubble-5");
GameData.Menus.ToyMenu = new Object();
GameData.Menus.ToyMenu.Size = 140;
GameData.Menus.ToyMenu.XMod = 140;
GameData.Menus.ToyMenu.YMod = 40;
GameData.Menus.ToyMenu.Items = new Array();
AddMenuItem("ToyMenu", "Mysterious Gap", "ShowToy-Mysterious Gap");
AddMenuItem("ToyMenu", "Clone Capsule", "ShowToy-Clone Capsule");
AddMenuItem("ToyMenu", "Boxing Chen", "ShowToy-Boxing Chen");
AddMenuItem("ToyMenu", "Gravity Well", "ShowToy-Gravity Well");
AddMenuItem("ToyMenu", "Grouchy Reimu", "ShowToy-Grouchy Reimu");
GameData.Help = new Object();
GameData.Help.WalfasLinkX = -40;
GameData.Help.WalfasLinkY = 50;
GameData.Help.Locks = "That part is locked!\n\n";
GameData.Help.Locks = GameData.Help.Locks + "Go to target character's\nlock settings to unlock it.\n\n";
GameData.Help.Locks = GameData.Help.Locks + "If the character's lock for this part is unchecked, then try the global lock settings under the main menu.\n\n";
GameData.Help.Locks = GameData.Help.Locks + "The global lock and unlock all will also affect each character's locks.";
GameData.Help.Intro = "Hello, Eirin here to\nhelp you with learning\nhow to use this program.\n\n";
GameData.Help.Intro = GameData.Help.Intro + "What would you like to know?";
GameData.Help.Basics = "Click \"New Character\"\nto spawn a new character.\n";
GameData.Help.Basics = GameData.Help.Basics + "You can click on characters\nto select them. ";
GameData.Help.Basics = GameData.Help.Basics + "Dragging their body will move them. ";
GameData.Help.Basics = GameData.Help.Basics + "Dragging their head will rotate them. ";
GameData.Help.Basics = GameData.Help.Basics + "Holding shift while dragging will scale them.\n\n";
GameData.Help.Basics = GameData.Help.Basics + "When you click on a character, a target frame will appear on the bottom. ";
GameData.Help.Basics = GameData.Help.Basics + "Clicking this will bring up more options.";
GameData.Help.Updates = "Welcome to version " + GameData.Version + " of create.swf!\n\n";
GameData.Help.Updates = GameData.Help.Updates + "Check out the new options menu!\n\n";
GameData.Help.Updates = GameData.Help.Updates + "Keys 1-0 now change character faces!\n\n";
GameData.Help.Updates = GameData.Help.Updates + "Text bubbles can now spawn randomized!\n\n";
GameData.Help.Import = "\n\nYou're viewing this online!\n\n";
GameData.Help.Import = GameData.Help.Import + "You will only be able to import images from walfas.org.\n\n";
GameData.Help.Import = GameData.Help.Import + "If you wish to import images from anywhere, download the create.swf and run it locally.";
GameData.Help.About = "This is version " + GameData.Version + " of\ncreate.swf.\n\n";
GameData.Help.About = GameData.Help.About + "This program is property of\n\n\n\nand was originally created by KirbyM. ";
GameData.Help.About = GameData.Help.About + "The new version was coded by Thefre.";
GameData.Help.Rumors = new Array();
GameData.Help.Rumors.push("\n\n\n\nI hear Nitori is researching cloning technology.");
GameData.Help.Rumors.push("\n\n\n\nSuika has been playing tricks on people lately.");
GameData.Help.Rumors.push("\n\n\n\nBetter not get Reimu angry!");
GameData.Help.Rumors.push("\n\n\n\nI heard there's been a mysterious gap floating around Gensokyo.");
GameData.Help.Rumors.push("\n\n\n\nI think Chen is lurking around somewhere.");
GameData.Help.Rumors.push("\n\n\n\nI hear some of the backgrounds are interactive!");
GameData.Help.Rumors.push("\n\n\n\nI think Marisa stole some of my...\"Precious Things\".");
GameData.Parts = new Object();
GameData.Parts.Hats = new Array();
GameData.Parts.Hats.push("none");
GameData.Parts.Hats.push(["China Hat", 1, 0, 0, 0]);
GameData.Parts.Hats.push(["Red Ribbon", 2, 0, 0, 0]);
GameData.Parts.Hats.push(["Witch Hat", 3, 0, 0, 0]);
GameData.Parts.Hats.push(["Sakuya Band", 4, 0, 0, 0]);
GameData.Parts.Hats.push(["Yukari Cap", 5, 0, 0, 0]);
GameData.Parts.Hats.push(["Flandre Cap", 6, 0, 0, 0]);
GameData.Parts.Hats.push(["Yuyuko Cap", 7, 0, 0, 0]);
GameData.Parts.Hats.push(["Headphones", 8, 0, -20, -5]);
GameData.Parts.Hats.push(["Blue Ribbon", 9, 0, 0, 0]);
GameData.Parts.Hats.push(["Eirin Hat", 10, 0, 0, 0]);
GameData.Parts.Hats.push(["Youmu Band", 11, 0, 0, 0]);
GameData.Parts.Hats.push(["Patchy Cap", 12, 0, 0, 0]);
GameData.Parts.Hats.push(["Hairband", 13, 0, 0, 0]);
GameData.Parts.Hats.push(["Reisen's Ears", 14, 0, 0, 0]);
GameData.Parts.Hats.push(["Mokou's Bow", 15, 0, 0, 0]);
GameData.Parts.Hats.push(["Sparrow Cap", 16, 0, 0, 0]);
GameData.Parts.Hats.push(["Bunny Ears", 17, 0, 0, 0]);
GameData.Parts.Hats.push(["Bento Hat", 18, 0, 0, 0]);
GameData.Parts.Hats.push(["Ran's Cap", 19, 0, 0, 0]);
GameData.Parts.Hats.push(["Letty's Cap", 20, 0, 0, 0]);
GameData.Parts.Hats.push(["Chen's Cap", 21, 0, 0, 0]);
GameData.Parts.Hats.push(["Suika's Horns", 22, 0, 0, 0]);
GameData.Parts.Hats.push(["Remilia's Cap", 23, 0, 0, 0]);
GameData.Parts.Hats.push(["Lily White's Cap", 24, 0, 0, 0]);
GameData.Parts.Hats.push(["Lily Black's Cap", 25, 0, 0, 0]);
GameData.Parts.Hats.push(["Hair Beads", 26, 0, 0, 0]);
GameData.Parts.Hats.push(["Kappa Cap", 27, 0, 0, 0]);
GameData.Parts.Hats.push(["Judgement Helm", 28, 0, 0, 0]);
GameData.Parts.Hats.push(["Bug Feelers", 29, 0, 0, 0]);
GameData.Parts.Hats.push(["Rumia's Amulet", 30, 0, 0, 0]);
GameData.Parts.Hats.push(["Tengu Hat", 31, 0, 0, 0]);
GameData.Parts.Hats.push(["Mini Tengu Hat", 32, 0, 0, 0]);
GameData.Parts.Hats.push(["Devil Wings", 33, 0, 0, 0]);
GameData.Parts.Hats.push(["Lunasa's Hat", 34, 0, 0, 0]);
GameData.Parts.Hats.push(["Merlin's Hat", 35, 0, 0, 0]);
GameData.Parts.Hats.push(["Lyrica's Hat", 36, 0, 0, 0]);
GameData.Parts.Hats.push(["Yellow Ribbon", 37, 0, 0, 0]);
GameData.Parts.Hats.push(["Medicine's Knot", 38, 0, 0, 0]);
GameData.Parts.Hats.push(["EX-Keine's Horns", 39, 0, 0, 0]);
GameData.Parts.Hats.push(["Top Hat", 40, 0, 0, 0]);
GameData.Parts.Hats.push(["The Frog God", 41, 0, 0, 0]);
GameData.Parts.Hats.push(["Hina Ribbon", 42, 0, 0, 0]);
GameData.Parts.Hats.push(["Frog Clip", 43, 0, 0, 0]);
GameData.Parts.Hats.push(["Rope Bandana", 44, 0, 0, 0]);
GameData.Parts.Hats.push(["Harvest Cap", 45, 0, 0, 0]);
GameData.Parts.Hats.push(["Maple Leaves", 46, 0, 0, 0]);
GameData.Parts.Hats.push(["Shinki's Beads", 47, 0, 0, 0]);
GameData.Parts.Hats.push(["Mima Cap", 48, 0, 0, 0]);
GameData.Parts.Hats.push(["Safety Hat", 49, 0, 0, 0]);
GameData.Parts.Hats.push(["Tokiko's Clip", 50, 0, 0, 0]);
GameData.Parts.Hats.push(["Sunny Band", 51, 0, 0, 0]);
GameData.Parts.Hats.push(["Star Ribbon", 52, 0, 0, 0]);
GameData.Parts.Hats.push(["Luna Cap", 53, 0, 0, 0]);
GameData.Parts.Hats.push(["Flower Clip", 54, 0, 0, 0]);
GameData.Parts.Hats.push(["Fedora", 55, 0, 0, 0]);
GameData.Parts.Hats.push(["Maribel's Cap", 56, 0, 0, 0]);
GameData.Parts.Hats.push(["Sailor Hat", 57, 0, 0, 0]);
GameData.Parts.Hats.push(["Summer Hat", 58, 0, 0, 0]);
GameData.Parts.Hats.push(["Old Red Ribbon", 59, 0, 0, 0]);
GameData.Parts.Hats.push(["Black Ribbon", 60, 0, 0, 0]);
GameData.Parts.Hats.push(["Peach Hat", 61, 0, 0, 0]);
GameData.Parts.Hats.push(["Iku's Hat", 62, 0, 0, 0]);
GameData.Parts.Hats.push(["Yuugi's Horn", 63, 0, 0, 0]);
GameData.Parts.Hats.push(["Kisume's Beads", 64, 0, 0, 0]);
GameData.Parts.Hats.push(["Headset", 65, 0, -20, -5]);
GameData.Parts.Hats.push(["Orange Band", 66, 0, 0, 0]);
GameData.Parts.Hats.push(["Toyohime's Hat", 67, 0, 0, 0]);
GameData.Parts.Hats.push(["PC-98 Witch Hat", 68, 0, 0, 0]);
GameData.Parts.Hats.push(["Chef's Hat", 69, 0, 0, 0]);
GameData.Parts.Hats.push(["Alice Bow (PC-98)", 70, 0, 0, 0]);
GameData.Parts.Hats.push(["Kurumi's Bow", 71, 0, 0, 0]);
GameData.Parts.Hats.push(["Luize's Hat", 72, 0, 0, 0]);
GameData.Parts.Hats.push(["Utsuho's Bow", 73, 0, 0, 0]);
GameData.Parts.Hats.push(["Orin's Cat Ears", 74, 0, 0, 0]);
GameData.Parts.Hats.push(["Satori Band", 75, 0, 0, 0]);
GameData.Parts.Hats.push(["Koishi's Hat", 76, 0, 0, 0]);
GameData.Parts.Hats.push(["Yumeko Band", 77, 0, 0, 0]);
GameData.Parts.Hats.push(["Ruukoto Band", 78, 0, 0, 0]);
GameData.Parts.Hats.push(["Mugetsu Band", 79, 0, 0, 0]);
GameData.Parts.Hats.push(["VIVIT Band", 80, 0, 0, 0]);
GameData.Parts.Hats.push(["Gengetsu's Bow", 81, 0, 0, 0]);
GameData.Parts.Hats.push(["Halo", 82, 0, 0, 0]);
GameData.Parts.Hats.push(["Konngara's Horn", 83, 0, 0, 0]);
GameData.Parts.Hats.push(["Police Cap", 84, 0, 0, 0]);
GameData.Parts.Hats.push(["Orange's Hat", 85, 0, 0, 0]);
GameData.Parts.Hats.push(["Rikako Band", 86, 0, 0, 0]);
GameData.Parts.Hats.push(["Rika's Hat", 87, 0, 0, 0]);
GameData.Parts.Hats.push(["Yuki's Hat", 88, 0, 0, 0]);
GameData.Parts.Hats.push(["Mai's Bow", 89, 0, 0, 0]);
GameData.Parts.Hats.push(["Ellen's Band", 90, 0, 0, 0]);
GameData.Parts.Hats.push(["Kana's Hat", 91, 0, 0, 0]);
GameData.Parts.Hats.push(["Elly's Hat", 92, 0, 0, 0]);
GameData.Parts.Hats.push(["Orange Planet", 93, 0, 0, 0]);
GameData.Parts.Hats.push(["Meira's Band", 94, 0, 0, 0]);
GameData.Parts.Hats.push(["Elis' Bow", 95, 0, 0, 0]);
GameData.Parts.Hats.push(["Shingyoku F", 96, 0, 0, 0]);
GameData.Parts.Hats.push(["Shingyoku M", 97, 0, 0, 0]);
GameData.Parts.Hats.push(["Yuka (PJ's)", 98, 0, 0, 0]);
GameData.Parts.Hats.push(["Yukari Cap 2", 99, 0, 0, 0]);
GameData.Parts.Hats.push(["Marisa Hat (SA)", 100, 0, 0, 0]);
GameData.Parts.Hats.push(["MoonRabbit Helm", 101, 0, 0, 0]);
GameData.Parts.Hats.push(["Mouse Ears", 102, 0, 0, 0]);
GameData.Parts.Hats.push(["ZUN Hat", 103, 0, 0, 0]);
GameData.Parts.Hats.push(["Ichirin's Veil", 104, 0, 0, 0]);
GameData.Parts.Hats.push(["Marisa Hat (UFO)", 105, 0, 0, 0]);
GameData.Parts.Hats.push(["Zombie Halo", 106, 0, 0, 0]);
GameData.Parts.Hats.push(["Shanghai Bow", 107, 0, 0, 0]);
GameData.Parts.Hats.push(["Motorcycle Helm", 108, 0, 0, 0]);
GameData.Parts.Hats.push(["Meimu Bow", 109, 0, 0, 0]);
GameData.Parts.Hats.push(["China Hat (2)", 110, 0, 0, 0]);
GameData.Parts.Hats.push(["Lie Meiling", 111, 0, 0, 0]);
GameData.Parts.Hats.push(["Reimu Ribbon", 112, 0, 0, 0]);
GameData.Parts.Hats.push(["Marisa (PCB)", 113, 0, 0, 0]);
GameData.Parts.Hats.push(["Sakuya Band 2", 114, 0, 0, 0]);
GameData.Parts.Hats.push(["Flandre Hat 2", 115, 0, 0, 0]);
GameData.Parts.Hats.push(["Yuyuko Hat 2", 116, 0, 0, 0]);
GameData.Parts.Hats.push(["Cirno Bow (Blue)", 117, 0, 0, 0]);
GameData.Parts.Hats.push(["Cirno Bow (Green)", 118, 0, 0, 0]);
GameData.Parts.Hats.push(["Cirno Simple Bow", 119, 0, 0, 0]);
GameData.Parts.Hats.push(["Cirno Bonnet", 120, 0, 0, 0]);
GameData.Parts.Hats.push(["Eirin Hat 2", 121, 0, 0, 0]);
GameData.Parts.Hats.push(["Virt.Reality Helm", 122, 0, 0, 0]);
GameData.Parts.Hats.push(["Youmu Band 2", 123, 0, 0, 0]);
GameData.Parts.Hats.push(["Patchy Cap 2", 124, 0, 0, 0]);
GameData.Parts.Hats.push(["Alice Band 2", 125, 0, 0, 0]);
GameData.Parts.Hats.push(["Reisen Ears 2", 126, 0, 0, 0]);
GameData.Parts.Hats.push(["Mokou's Bow 2", 127, 0, 0, 0]);
GameData.Parts.Hats.push(["Mystia Cap 2", 128, 0, 0, 0]);
GameData.Parts.Hats.push(["Bandana", 129, 0, 0, 0]);
GameData.Parts.Hats.push(["Tewi Ears 2", 130, 0, 0, 0]);
GameData.Parts.Hats.push(["Bento Hat 2", 131, 0, 0, 0]);
GameData.Parts.Hats.push(["EX Keine Horns", 132, 0, 0, 0]);
GameData.Parts.Hats.push(["Ran Hat 2", 133, 0, 0, 0]);
GameData.Parts.Hats.push(["Letty Hat 2", 134, 0, 0, 0]);
GameData.Parts.Hats.push(["Chen Hat 2", 135, 0, 0, 0]);
GameData.Parts.Hats.push(["Suika Horns 2", 136, 0, 0, 0]);
GameData.Parts.Hats.push(["Murasa's Cap", 137, 0, 0, 0]);
GameData.Parts.Hats.push(["Shou's Ornament", 138, 0, 0, 0]);
GameData.Parts.Hats.push(["Remilia's Hat 2", 139, 0, 0, 0]);
GameData.Parts.Hats.push(["Lily White Hat 2", 140, 0, 0, 0]);
GameData.Parts.Hats.push(["Lily Black Hat 2", 141, 0, 0, 0]);
GameData.Parts.Hats.push(["Komachi Beads 2", 142, 0, 0, 0]);
GameData.Parts.Hats.push(["Kappa Cap 2", 143, 0, 0, 0]);
GameData.Parts.Hats.push(["Judgement Helm 2", 144, 0, 0, 0]);
GameData.Parts.Hats.push(["Antennae", 145, 0, 0, 0]);
GameData.Parts.Hats.push(["Rumia's Amulet 2", 146, 0, 0, 0]);
GameData.Parts.Hats.push(["Tengu Hat 2A", 147, 0, 0, 0]);
GameData.Parts.Hats.push(["Tengu Hat 2B", 148, 0, 0, 0]);
GameData.Parts.Hats.push(["Momizi Hat+Ears", 149, 0, 0, 0]);
GameData.Parts.Hats.push(["Devil Wings 2", 150, 0, 0, 0]);
GameData.Parts.Hats.push(["Witch Hat 2", 151, 0, 0, 0]);
GameData.Parts.Hats.push(["Lunasa's Hat 2", 152, 0, 0, 0]);
GameData.Parts.Hats.push(["Merlin's Hat 2", 153, 0, 0, 0]);
GameData.Parts.Hats.push(["Lyrica's Hat 2", 154, 0, 0, 0]);
GameData.Parts.Hats.push(["Sanae (Magical)", 155, 0, 0, 0]);
GameData.Parts.Hats.push(["Yellow Ribbon 2", 156, 0, 0, 0]);
GameData.Parts.Hats.push(["Medicine's Knot 2", 157, 0, 0, 0]);
GameData.Parts.Hats.push(["Santa Hat", 158, 0, 0, 0]);
GameData.Parts.Hats.push(["The Frog God 2", 159, 0, 0, 0]);
GameData.Parts.Hats.push(["Hina Ribbon 2A", 160, 0, 0, 0]);
GameData.Parts.Hats.push(["Frog Clip 2", 161, 0, 0, 0]);
GameData.Parts.Hats.push(["Gas Mask", 162, 0, 0, 0]);
GameData.Parts.Hats.push(["Rope Bandana 2", 163, 0, 0, 0]);
GameData.Parts.Hats.push(["Hina Ribbon 2B", 164, 0, 0, 0]);
GameData.Parts.Hats.push(["Green Bandana", 165, 0, 0, 0]);
GameData.Parts.Hats.push(["Balaclava", 166, 0, 0, 0]);
GameData.Parts.Hats.push(["Harvest Cap 2", 167, 0, 0, 0]);
GameData.Parts.Hats.push(["InuSakuya", 168, 0, 0, 0]);
GameData.Parts.Hats.push(["Maple Leaves 2", 169, 0, 0, 0]);
GameData.Parts.Hats.push(["Black Band", 170, 0, 0, 0]);
GameData.Parts.Hats.push(["Shinki's Beads 2", 171, 0, 0, 0]);
GameData.Parts.Hats.push(["Darth Vader Helm", 172, 0, 0, 0]);
GameData.Parts.Hats.push(["Mima Cap 2", 173, 0, 0, 0]);
GameData.Parts.Hats.push(["Mima Cap 2 (Mima)", 174, 0, 0, 0]);
GameData.Parts.Hats.push(["Dunce Cap", 175, 0, 0, 0]);
GameData.Parts.Hats.push(["MGS Cyborg-Ninja", 176, 0, 0, 0]);
GameData.Parts.Hats.push(["MGS Cyborg-Ninja 2", 177, 0, 0, 0]);
GameData.Parts.Hats.push(["Reimu Ribbon 2P", 178, 0, 0, 0]);
GameData.Parts.Hats.push(["Straw Hat", 179, 0, 0, 0]);
GameData.Parts.Hats.push(["Ushanka", 180, 0, 0, 0]);
GameData.Parts.Hats.push(["Rengeteki Bow", 181, 0, 0, 0]);
GameData.Parts.Hats.push(["Panda Beanie", 182, 0, 0, 0]);
GameData.Parts.Hats.push(["Football Helmet", 183, 0, 0, 0]);
GameData.Parts.Hats.push(["Wedding Veil", 184, 0, 0, 0]);
GameData.Parts.Hats.push(["Motorcycle Helm 2", 185, 0, 0, 0]);
GameData.Parts.Hats.push(["Ran's Ears", 186, 0, 0, 0]);
GameData.Parts.Hats.push(["Chen's Ears", 187, 0, 0, 0]);
GameData.Parts.Hats.push(["Tokiko's Clip 2", 188, 0, 0, 0]);
GameData.Parts.Hats.push(["Sunny Band 2", 189, 0, 0, 0]);
GameData.Parts.Hats.push(["Momizi Ears", 190, 0, 0, 0]);
GameData.Parts.Hats.push(["Mettaur (Yellow)", 191, 0, 0, 0]);
GameData.Parts.Hats.push(["Mettaur (Blue)", 192, 0, 0, 0]);
GameData.Parts.Hats.push(["Mettaur (Red)", 193, 0, 0, 0]);
GameData.Parts.Hats.push(["Miner's Helm", 194, 0, 0, 0]);
GameData.Parts.Hats.push(["Star Ribbon 2", 195, 0, 0, 0]);
GameData.Parts.Hats.push(["Trilby Hat (Black)", 196, 0, 0, 0]);
GameData.Parts.Hats.push(["Trilby Hat (Brown)", 197, 0, 0, 0]);
GameData.Parts.Hats.push(["Ram horns", 198, 0, 0, 0]);
GameData.Parts.Hats.push(["Hatate Tokin", 199, 0, 0, 0]);
GameData.Parts.Hats.push(["Luna Cap 2", 200, 0, 0, 0]);
GameData.Parts.Hats.push(["Jason Mask", 201, 0, 0, 0]);
GameData.Parts.Hats.push(["Cabbie Hat", 202, 0, 0, 0]);
GameData.Parts.Hats.push(["Baseball Cap", 203, 0, 0, 0]);
GameData.Parts.Hats.push(["Red Bandana", 204, 0, 0, 0]);
GameData.Parts.Hats.push(["Bowler Hat", 205, 0, 0, 0]);
GameData.Parts.Hats.push(["Tied Headband", 206, 0, 0, 0]);
GameData.Parts.Hats.push(["Paper Bag", 207, 0, 0, 0]);
GameData.Parts.Hats.push(["Flower Clip 2", 208, 0, 0, 0]);
GameData.Parts.Hats.push(["Bandana+Patch", 209, 0, 0, 0]);
GameData.Parts.Hats.push(["Fedora 2", 210, 0, 0, 0]);
GameData.Parts.Hats.push(["Maribel's Cap 2", 211, 0, 0, 0]);
GameData.Parts.Hats.push(["Moonrabbit helm 2", 212, 0, 0, 0]);
GameData.Parts.Hats.push(["Link Hat", 213, 0, 0, 0]);
GameData.Parts.Hats.push(["Kotone Hat", 214, 0, 0, 0]);
GameData.Parts.Hats.push(["Black Ribbon 2", 215, 0, 0, 0]);
GameData.Parts.Hats.push(["Sailor Hat 2", 216, 0, 0, 0]);
GameData.Parts.Hats.push(["Mystia (Black)", 217, 0, 0, 0]);
GameData.Parts.Hats.push(["Butterfly Crown", 218, 0, 0, 0]);
GameData.Parts.Hats.push(["Keine (Alt)", 219, 0, 0, 0]);
GameData.Parts.Hats.push(["Kitsune Mask", 220, 0, 0, 0]);
GameData.Parts.Hats.push(["Tall Hat", 221, 0, 0, 0]);
GameData.Parts.Hats.push(["Ghost Triangle", 222, 0, 0, 0]);
GameData.Parts.Hats.push(["Cirno (Fire)", 223, 0, 0, 0]);
GameData.Parts.Hats.push(["Pirate", 224, 0, 0, 0]);
GameData.Parts.Hats.push(["Beret (Black)", 225, 0, 0, 0]);
GameData.Parts.Hats.push(["Beret (Green)", 226, 0, 0, 0]);
GameData.Parts.Hats.push(["Army Helm (Camo)", 227, 0, 0, 0]);
GameData.Parts.Hats.push(["Army Helm (Grey)", 228, 0, 0, 0]);
GameData.Parts.Hats.push(["Old Red Ribbon 2", 229, 0, 0, 0]);
GameData.Parts.Hats.push(["Butterfly Crown 2", 230, 0, 0, 0]);
GameData.Parts.Hats.push(["Suika Horns (Alt)", 231, 0, 0, 0]);
GameData.Parts.Hats.push(["Tie (Red)", 232, 0, 0, 0]);
GameData.Parts.Hats.push(["Crown", 233, 0, 0, 0]);
GameData.Parts.Hats.push(["Lampshade", 234, 0, 0, 0]);
GameData.Parts.Hats.push(["Tied Headband (Yellow)", 235, 0, 0, 0]);
GameData.Parts.Hats.push(["Peach Hat 2", 236, 0, 0, 0]);
GameData.Parts.Hats.push(["Mushroom Cap", 237, 0, 0, 0]);
GameData.Parts.Hats.push(["Reimu (2 Alt)", 238, 0, 0, 0]);
GameData.Parts.Hats.push(["White Band", 239, 0, 0, 0]);
GameData.Parts.Hats.push(["Yellow Band", 240, 0, 0, 0]);
GameData.Parts.Hats.push(["Snorkel", 241, 0, 0, 0]);
GameData.Parts.Hats.push(["Knight Helm", 242, 0, 0, 0]);
GameData.Parts.Hats.push(["Reisen II Ears", 243, 0, 0, 0]);
GameData.Parts.Hats.push(["Iku's Hat", 244, 0, 0, 0]);
GameData.Parts.Hats.push(["Mima Bandana", 245, 0, 0, 0]);
GameData.Parts.Hats.push(["Mima Bandana 2", 246, 0, 0, 0]);
GameData.Parts.Hats.push(["Aviator Hat", 247, 0, 0, 0]);
GameData.Parts.Hats.push(["Towel", 248, 0, 0, 0]);
GameData.Parts.Hats.push(["Tie (Yellow)", 249, 0, 0, 0]);
GameData.Parts.Hats.push(["Yuugi's Horn 2", 250, 0, 0, 0]);
GameData.Parts.Hats.push(["Red Mushroom Cap", 251, 0, 0, 0]);
GameData.Parts.Hats.push(["Red Mushroom", 252, 0, 0, 0]);
GameData.Parts.Hats.push(["Aviator Goggles", 253, 0, 0, 0]);
GameData.Parts.Hats.push(["Mario", 254, 0, 0, 0]);
GameData.Parts.Hats.push(["Luigi", 255, 0, 0, 0]);
GameData.Parts.Hats.push(["Utsuho's Bow 2", 256, 0, 0, 0]);
GameData.Parts.Hats.push(["Megaman Helmet", 257, 0, 0, 0]);
GameData.Parts.Hats.push(["Orin's Cat Ears 2", 258, 0, 0, 0]);
GameData.Parts.Hats.push(["Jester Hat", 259, 0, 0, 0]);
GameData.Parts.Hats.push(["Black Hood", 260, 0, 0, 0]);
GameData.Parts.Hats.push(["Tiger Ears", 261, 0, 0, 0]);
GameData.Parts.Hats.push(["Baseball Cap (Green)", 262, 0, 0, 0]);
GameData.Parts.Hats.push(["Baseball Cap (Orange)", 263, 0, 0, 0]);
GameData.Parts.Hats.push(["Baseball Cap (Red)", 264, 0, 0, 0]);
GameData.Parts.Hats.push(["Satori Band 2", 265, 0, 0, 0]);
GameData.Parts.Hats.push(["Toeto", 266, 0, 0, 0]);
GameData.Parts.Hats.push(["Shou's Ornament 2", 267, 0, 0, 0]);
GameData.Parts.Hats.push(["Old Green Ribbon", 268, 0, 0, 0]);
GameData.Parts.Hats.push(["Baseball Cap Back", 269, 0, 0, 0]);
GameData.Parts.Hats.push(["Koishi's Hat 2", 270, 0, 0, 0]);
GameData.Parts.Hats.push(["Fez", 271, 0, 0, 0]);
GameData.Parts.Hats.push(["Samus", 272, 0, 0, 0]);
GameData.Parts.Hats.push(["Hair buns", 273, 0, 0, 0]);
GameData.Parts.Hats.push(["Puyo Hat", 274, 0, 0, 0]);
GameData.Parts.Hats.push(["Four Horns", 275, 0, 0, 0]);
GameData.Parts.Hats.push(["Cabbie Hat (Blue)", 276, 0, 0, 0]);
GameData.Parts.Hats.push(["Mitori's Hat", 277, 0, 0, 0]);
GameData.Parts.Hats.push(["Lan Headband", 278, 0, 0, 0]);
GameData.Parts.Hats.push(["Sombrero", 279, 0, 0, 0]);
GameData.Parts.Hats.push(["Box Hat", 280, 0, 0, 0]);
GameData.Parts.Hats.push(["Fedora (no bow)", 281, 0, 0, 0]);
GameData.Parts.Hats.push(["Beret (Brown)", 282, 0, 0, 0]);
GameData.Parts.Hats.push(["Cabbie Hat (Brown)", 283, 0, 0, 0]);
GameData.Parts.Hats.push(["Orange Band 2", 284, 0, 0, 0]);
GameData.Parts.Hats.push(["Toyohime's Hat 2", 285, 0, 0, 0]);
GameData.Parts.Hats.push(["Alice Bow (PC-98) 2", 286, 0, 0, 0]);
GameData.Parts.Hats.push(["Kurumi's Bow 2", 287, 0, 0, 0]);
GameData.Parts.Hats.push(["PC-98 Witch Hat 2", 288, 0, 0, 0]);
GameData.Parts.Hats.push(["Luize's Hat 2", 289, 0, 0, 0]);
GameData.Parts.Hats.push(["Yumeko Band 2", 290, 0, 0, 0]);
GameData.Parts.Hats.push(["Ruukoto Band 2", 291, 0, 0, 0]);
GameData.Parts.Hats.push(["Party Hat", 292, 0, 0, 0]);
GameData.Parts.Hats.push(["Mugetsu Band 2", 293, 0, 0, 0]);
GameData.Parts.Hats.push(["Gengetsu's Bow 2", 294, 0, 0, 0]);
GameData.Parts.Hats.push(["Konngara's Horn 2", 295, 0, 0, 0]);
GameData.Parts.Hats.push(["Top Hat (Pink)", 296, 0, 0, 0]);
GameData.Parts.Hats.push(["Bow (Purple)", 297, 0, 0, 0]);
GameData.Parts.Hats.push(["Bow (Yellow)", 298, 0, 0, 0]);
GameData.Parts.Hats.push(["Orange's Hat 2", 299, 0, 0, 0]);
GameData.Parts.Hats.push(["Rikako Band 2", 300, 0, 0, 0]);
GameData.Parts.Hats.push(["Top Hat w/ Horns", 301, 0, 0, 0]);
GameData.Parts.Hats.push(["Rika's Hat 2", 302, 0, 0, 0]);
GameData.Parts.Hats.push(["Yuki's Hat 2", 303, 0, 0, 0]);
GameData.Parts.Hats.push(["VIVIT Band 2", 304, 0, 0, 0]);
GameData.Parts.Hats.push(["Suika Horns (Alt2)", 305, 0, 0, 0]);
GameData.Parts.Hats.push(["Mai's Bow 2", 306, 0, 0, 0]);
GameData.Parts.Hats.push(["Ellen's Band 2", 307, 0, 0, 0]);
GameData.Parts.Hats.push(["Kana's Hat 2", 308, 0, 0, 0]);
GameData.Parts.Hats.push(["Elly's Hat 2", 309, 0, 0, 0]);
GameData.Parts.Hats.push(["Rabbit Ears (Black)", 310, 0, 0, 0]);
GameData.Parts.Hats.push(["Cabbie Hat (Red)", 311, 0, 0, 0]);
GameData.Parts.Hats.push(["Headphones (Red-White)", 312, 0, 0, 0]);
GameData.Parts.Hats.push(["Meira's Band 2", 313, 0, 0, 0]);
GameData.Parts.Hats.push(["Elis' Bow 2", 314, 0, 0, 0]);
GameData.Parts.Hats.push(["Trilby Hat (White)", 315, 0, 0, 0]);
GameData.Parts.Hats.push(["Reisen Ears (black)", 316, 0, 0, 0]);
GameData.Parts.Hats.push(["Shingyoku F 2", 317, 0, 0, 0]);
GameData.Parts.Hats.push(["Shingyoku M 2", 318, 0, 0, 0]);
GameData.Parts.Hats.push(["Yuka (PJ's) 2", 319, 0, 0, 0]);
GameData.Parts.Hats.push(["Yukari Cap 3", 320, 0, 0, 0]);
GameData.Parts.Hats.push(["Mouse Ears 2", 321, 0, 0, 0]);
GameData.Parts.Hats.push(["Reimu Ribbon (White)", 322, 0, 0, 0]);
GameData.Parts.Hats.push(["Reimu Ribbon (White 2)", 323, 0, 0, 0]);
GameData.Parts.Hats.push(["Ichirin's Veil 2", 324, 0, 0, 0]);
GameData.Parts.Hats.push(["Tengu Mask", 325, 0, 0, 0]);
GameData.Parts.Hats.push(["Shanghai Bow 2", 326, 0, 0, 0]);
GameData.Parts.Hats.push(["Reimu Ribbon (Green)", 327, 0, 0, 0]);
GameData.Parts.Hats.push(["Kyouko Ears 1", 328, 0, 0, 0]);
GameData.Parts.Hats.push(["Kyouko Ears 2", 329, 0, 0, 0]);
GameData.Parts.Hats.push(["Yoshika Hat", 330, 0, 0, 0]);
GameData.Parts.Hats.push(["Yoshika Hat+", 331, 0, 5, 0]);
GameData.Parts.Hats.push(["Yoshika Seal", 332, 0, -10, 0]);
GameData.Parts.Hats.push(["Seiga Hair Stick", 333, 0, 5, 0]);
GameData.Parts.Hats.push(["Seiga Hair Stick 2", 334, 0, 5, 0]);
GameData.Parts.Hats.push(["Tojiko Hat", 335, 0, 5, 0]);
GameData.Parts.Hats.push(["Futo Hat", 336, 0, 5, 0]);
GameData.Parts.Hats.push(["Miko Headphones", 337, 0, 5, 0]);
GameData.Parts.Hats.push(["Mamizou", 338, 0, 5, 0]);
GameData.Parts.Hats.push(["Mamizou Ears", 339, 0, 5, 0]);
GameData.Parts.Hats.push(["Mamizou Leaf", 340, 0, 5, 0]);
GameData.Parts.Hats.push("random");
GameData.Parts.Items = new Array();
GameData.Parts.Items.push("none");
GameData.Parts.Items.push(["Miko Stick", 1, -20, 0, 0]);
GameData.Parts.Items.push(["Broom", 2, 0, 0, -10]);
GameData.Parts.Items.push(["Knife", 3, -20, 0, 0]);
GameData.Parts.Items.push(["Gap", 4, 0, 0, 0]);
GameData.Parts.Items.push(["Levatein", 5, 0, 0, 0]);
GameData.Parts.Items.push(["MEAT", 6, -20, 0, 2]);
GameData.Parts.Items.push(["Popsicle", 7, -20, 0, 2]);
GameData.Parts.Items.push(["Pet Frog", 8, -20, -18, 0]);
GameData.Parts.Items.push(["Bow", 9, 0, -2, -3]);
GameData.Parts.Items.push(["Youmu Set", 10, 6, 10, -13]);
GameData.Parts.Items.push(["Book", 11, -15, -15, 10]);
GameData.Parts.Items.push(["Alice's Grimoire", 12, -15, -15, 10]);
GameData.Parts.Items.push(["Mallet", 13, -6, 0, -5]);
GameData.Parts.Items.push(["Cleaver", 14, -20, 0, 1]);
GameData.Parts.Items.push(["Cell Phone", 15, -20, -10, 10]);
GameData.Parts.Items.push(["Arm Cannon", 16, -20, -10, 10]);
GameData.Parts.Items.push(["Pink Gloves", 17, 0, -10, 10]);
GameData.Parts.Items.push(["Bunny Doll", 18, -13, -10, 1]);
GameData.Parts.Items.push(["Plunger", 19, -20, 0, 0]);
GameData.Parts.Items.push(["Magic Staff", 20, -13, 0, -5]);
GameData.Parts.Items.push(["Sword & Shield", 21, 0, 7, -9]);
GameData.Parts.Items.push(["Amulet", 22, -8, -8, 0]);
GameData.Parts.Items.push(["Meat Cleaver", 23, -20, -2, 0]);
GameData.Parts.Items.push(["Kite", 24, -20, 33, -5]);
GameData.Parts.Items.push(["Water Gun", 25, -7, -3, -5]);
GameData.Parts.Items.push(["Fork and Knife", 26, 0, -2, 0]);
GameData.Parts.Items.push(["Dual Fans", 27, 0, -10, -5]);
GameData.Parts.Items.push(["Mic", 28, -5, 0, 0]);
GameData.Parts.Items.push(["Carrot", 29, -10, 0, 0]);
GameData.Parts.Items.push(["Carrot Stick", 30, -13, 8, -5]);
GameData.Parts.Items.push(["Fried Eggs", 31, -17, 3, -3]);
GameData.Parts.Items.push(["Baseball Bat", 32, -22, 0, -2]);
GameData.Parts.Items.push(["Truck", 33, -10, -8, 0]);
GameData.Parts.Items.push(["Flames of Fury!!", 34, 0, 0, 0]);
GameData.Parts.Items.push(["W-Melon Blade", 35, -8, 7, -8]);
GameData.Parts.Items.push(["Suika Shackles", 36, 0, -4, 0]);
GameData.Parts.Items.push(["Suika's Gourd", 37, -10, -10, 0]);
GameData.Parts.Items.push(["Beer", 38, -10, -10, 0]);
GameData.Parts.Items.push(["Gungnir", 39, -10, 0, -10]);
GameData.Parts.Items.push(["Parasol", 40, -6, 2, -10]);
GameData.Parts.Items.push(["Scythe", 41, 0, 3, -10]);
GameData.Parts.Items.push(["Wrench", 42, 1, -2, -3]);
GameData.Parts.Items.push(["Judgement Stick", 43, -5, -7, 0]);
GameData.Parts.Items.push(["Fishing Pole", 44, -17, 8, -5]);
GameData.Parts.Items.push(["Flashlight", 45, -10, 12, -15]);
GameData.Parts.Items.push(["Camera", 46, -10, -5, 0]);
GameData.Parts.Items.push(["Leaf Fan", 47, -10, -5, 0]);
GameData.Parts.Items.push(["Momizi's Gear", 48, 0, 2, -5]);
GameData.Parts.Items.push(["Tea", 49, -10, 0, 0]);
GameData.Parts.Items.push(["Violin", 50, -25, 0, 0]);
GameData.Parts.Items.push(["Trumpet", 51, -25, 3, 0]);
GameData.Parts.Items.push(["Keyboard", 52, -25, 0, 0]);
GameData.Parts.Items.push(["Flower", 53, -15, 0, 0]);
GameData.Parts.Items.push(["Boxing Gloves", 54, 0, 0, 0]);
GameData.Parts.Items.push(["Suzuran", 55, -15, 0, 0]);
GameData.Parts.Items.push(["Another flower", 56, -5, -2, -5]);
GameData.Parts.Items.push(["Sunflower", 57, -5, 3, -8]);
GameData.Parts.Items.push(["Leek", 58, -18, 0, 0]);
GameData.Parts.Items.push(["Sub Sandwich", 59, -15, -8, 0]);
GameData.Parts.Items.push(["Spatula", 60, -15, -8, 0]);
GameData.Parts.Items.push(["Crescent Staff", 61, -4, 5, -10]);
GameData.Parts.Items.push(["Warhead", 62, 0, 3, -10]);
GameData.Parts.Items.push(["Water Buckets", 63, 0, -8, 0]);
GameData.Parts.Items.push(["Thick Book", 64, -8, -5, 0]);
GameData.Parts.Items.push(["Milk", 65, -6, -5, 0]);
GameData.Parts.Items.push(["Ice Cream", 66, -8, 2, 0]);
GameData.Parts.Items.push(["Banana", 67, -8, -5, 0]);
GameData.Parts.Items.push(["Paintbrush", 68, -5, 2, -8]);
GameData.Parts.Items.push(["Scroll", 69, -2, -3, -10]);
GameData.Parts.Items.push(["Dual Swords", 70, 6, 10, -13]);
GameData.Parts.Items.push(["Chair", 71, -5, 0, -10]);
GameData.Parts.Items.push(["Cross", 72, 0, 3, -10]);
GameData.Parts.Items.push(["Staff", 73, 0, 3, -10]);
GameData.Parts.Items.push(["Sanae's Stick", 74, -13, 0, 0]);
GameData.Parts.Items.push(["Youmu's Sword", 75, -16, 5, -5]);
GameData.Parts.Items.push(["Dark Sword", 76, -16, 5, -5]);
GameData.Parts.Items.push(["Tenshi's Sword", 77, -16, 5, -5]);
GameData.Parts.Items.push(["Whip", 78, -16, 0, -5]);
GameData.Parts.Items.push(["Kendama", 79, -16, 0, 0]);
GameData.Parts.Items.push(["Sparkler", 80, -16, 0, 0]);
GameData.Parts.Items.push(["Bowl O' Sake", 81, -16, 0, 0]);
GameData.Parts.Items.push(["Sariel's Staff", 82, -16, 0, 0]);
GameData.Parts.Items.push(["Konngara's Sword", 83, -16, 0, 0]);
GameData.Parts.Items.push(["Nightstick", 84, -16, 0, 0]);
GameData.Parts.Items.push(["Mini-Hakkero", 85, -16, 0, 5]);
GameData.Parts.Items.push(["Orange's Baton", 86, -16, 0, 5]);
GameData.Parts.Items.push(["Test Tubes", 87, -16, 0, 5]);
GameData.Parts.Items.push(["Christmas Blade", 88, -16, 0, -5]);
GameData.Parts.Items.push(["NEET-hime Staff", 89, -16, 0, -5]);
GameData.Parts.Items.push(["Meira's Sword", 90, -16, 0, -5]);
GameData.Parts.Items.push(["Star Wand", 91, -16, 0, -4]);
GameData.Parts.Items.push(["Yuka's Watch", 92, -16, 0, -4]);
GameData.Parts.Items.push(["Weather Vanes", 93, -16, 0, -4]);
GameData.Parts.Items.push(["Kogasa Umbrella", 94, -16, 0, -4]);
GameData.Parts.Items.push(["Ichirin's Ring", 95, -16, 0, 0]);
GameData.Parts.Items.push(["Marisa's Wand", 96, -16, 0, 0]);
GameData.Parts.Items.push(["Erhu", 97, -16, 0, 0]);
GameData.Parts.Items.push(["Claws", 98, 5, 0, 0]);
GameData.Parts.Items.push(["Halberd", 99, -20, 0, 0]);
GameData.Parts.Items.push(["Dipper", 100, -16, 0, 0]);
GameData.Parts.Items.push(["Pagoda+Spear", 101, 5, 5, -10]);
GameData.Parts.Items.push(["Jeweled Pagoda", 102, 2, 0, 0]);
GameData.Parts.Items.push(["Nue's Trident 1", 103, -16, 0, 0]);
GameData.Parts.Items.push(["Nue's Trident 2", 104, -13, 0, 0]);
GameData.Parts.Items.push(["Scythe 2", 105, -13, 0, -10]);
GameData.Parts.Items.push(["Lightsaber (Green)", 106, -24, 0, 0]);
GameData.Parts.Items.push(["Lightsaber (Red)", 107, -24, 0, 0]);
GameData.Parts.Items.push(["Momizi's Gear 2", 108, 0, 2, -5]);
GameData.Parts.Items.push(["Knife 2", 109, -13, 0, 0]);
GameData.Parts.Items.push(["Sakuya Staff", 110, -16, 0, 0]);
GameData.Parts.Items.push(["Sanae Staff", 111, -16, 0, 0]);
GameData.Parts.Items.push(["Broom 2", 112, 0, 2, -5]);
GameData.Parts.Items.push(["Ice Sword", 113, -16, 0, 0]);
GameData.Parts.Items.push(["Parasol Closed", 114, -10, 2, -5]);
GameData.Parts.Items.push(["Shortsword", 115, -13, 0, 0]);
GameData.Parts.Items.push(["Two-handed Sword", 116, -16, 2, -5]);
GameData.Parts.Items.push(["Duster", 117, -16, 0, 0]);
GameData.Parts.Items.push(["Miko Stick 2", 118, -16, 2, -5]);
GameData.Parts.Items.push(["Youmu Set 2", 119, -10, 2, -5]);
GameData.Parts.Items.push(["Spellcard", 120, -16, 2, -5]);
GameData.Parts.Items.push(["Whip", 121, -16, 2, -5]);
GameData.Parts.Items.push(["Hatate's Phone", 122, 0, 2, -5]);
GameData.Parts.Items.push(["Scimitar", 123, -16, 2, -5]);
GameData.Parts.Items.push(["Gun", 124, -16, 2, -5]);
GameData.Parts.Items.push(["Spiked Club", 125, -16, 0, 0]);
GameData.Parts.Items.push(["Syringe", 126, -16, 2, 0]);
GameData.Parts.Items.push(["Chainsaw", 127, -16, 0, -3]);
GameData.Parts.Items.push(["Sickle", 128, -16, 0, 0]);
GameData.Parts.Items.push(["Butterfly Knife", 129, -10, 2, -5]);
GameData.Parts.Items.push(["Revolver", 130, -16, 2, -5]);
GameData.Parts.Items.push(["Flaming Sword", 131, -16, 5, -5]);
GameData.Parts.Items.push(["Metal Fan", 132, -16, 2, -5]);
GameData.Parts.Items.push(["Parasol 2", 133, -10, 2, -10]);
GameData.Parts.Items.push(["Bunny Guns", 134, -16, 2, -5]);
GameData.Parts.Items.push(["Spear", 135, -16, 2, -5]);
GameData.Parts.Items.push(["Alice's Grimoire 2", 136, -16, 2, -5]);
GameData.Parts.Items.push(["Handgun+Sword 1", 137, -16, 2, -5]);
GameData.Parts.Items.push(["Handgun+Sword 2", 138, -16, 2, -5]);
GameData.Parts.Items.push(["Dual Handguns", 139, -16, 2, -5]);
GameData.Parts.Items.push(["Handgun", 140, -16, 2, -5]);
GameData.Parts.Items.push(["Mega Buster", 141, -10, 2, -5]);
GameData.Parts.Items.push(["Pom-poms", 142, -16, 2, -5]);
GameData.Parts.Items.push(["Yorihime's Sword", 143, -16, 2, -5]);
GameData.Parts.Items.push(["Toyohime's Fans", 144, -16, 2, -5]);
GameData.Parts.Items.push(["Wristwatch (Red)", 145, 0, 2, 1]);
GameData.Parts.Items.push(["Wristwatch (Blue)", 146, 0, 2, 1]);
GameData.Parts.Items.push(["Third Leg (Right)", 147, 0, 2, -5]);
GameData.Parts.Items.push(["Third Leg (Left)", 148, 0, 2, -5]);
GameData.Parts.Items.push(["Third Leg (Both)", 149, 0, 2, -5]);
GameData.Parts.Items.push(["Mega Buster (Dual)", 150, 0, 2, -5]);
GameData.Parts.Items.push(["Road Sign", 151, -5, 2, -8]);
GameData.Parts.Items.push(["Sanae's Stick 2", 152, -5, 2, -8]);
GameData.Parts.Items.push(["Sword of some sort", 153, -5, 2, -8]);
GameData.Parts.Items.push(["Kogasa Umbrella 2", 154, -16, 0, -4]);
GameData.Parts.Items.push(["Miko's Shaku", 155, 0, 2, 1]);
GameData.Parts.Items.push("random");
GameData.Parts.Back = new Array();
GameData.Parts.Back.push("none");
GameData.Parts.Back.push(["Flandre's Wings", 1, 0, 0, 0]);
GameData.Parts.Back.push(["Ice Fairy Wings", 2, 0, -10, 0]);
GameData.Parts.Back.push(["Dark Wings", 3, 0, 0, 0]);
GameData.Parts.Back.push(["Night Bird Wings", 4, 0, 0, 0]);
GameData.Parts.Back.push(["Blue Bird Wings", 5, 0, 0, 0]);
GameData.Parts.Back.push(["Pixie Wings", 6, 0, -10, 0]);
GameData.Parts.Back.push(["Phoenix Wings", 7, 0, 0, 0]);
GameData.Parts.Back.push(["Pink Cape", 8, 2, -10, 0]);
GameData.Parts.Back.push(["Nine Tails", 9, 0, -10, 0]);
GameData.Parts.Back.push(["Chen's Tails", 10, -5, -46, 10]);
GameData.Parts.Back.push(["Remilia's Wings", 11, -5, -10, 0]);
GameData.Parts.Back.push(["Lily Wings", 12, -3, -10, 0]);
GameData.Parts.Back.push(["Backpack", 13, 4, -12, 2]);
GameData.Parts.Back.push(["Wriggle Cape", 14, 4, -12, 0]);
GameData.Parts.Back.push(["Tengu Wings", 15, 0, 0, 0]);
GameData.Parts.Back.push(["Wolf Tail", 16, 0, -46, 10]);
GameData.Parts.Back.push(["Devil Set", 17, 0, -10, 0]);
GameData.Parts.Back.push(["Golden Wings", 18, 0, -5, 0]);
GameData.Parts.Back.push(["EX-Keine's Tail", 19, -5, -85, 20]);
GameData.Parts.Back.push(["Sacred Ring", 20, 5, 10, -5]);
GameData.Parts.Back.push(["Shinki's Wings", 21, 7, 8, -5]);
GameData.Parts.Back.push(["Tokiko's Wings", 22, 0, 0, 0]);
GameData.Parts.Back.push(["Sunny Wings", 23, 3, -5, -2]);
GameData.Parts.Back.push(["Starry Wings", 24, 3, -5, -2]);
GameData.Parts.Back.push(["Lunar Wings", 25, 3, -5, -2]);
GameData.Parts.Back.push(["Myon", 26, -10, 14, 0]);
GameData.Parts.Back.push(["The Gap", 27, 0, 10, -5]);
GameData.Parts.Back.push(["Yuyuko's Fan", 28, 0, 10, -5]);
GameData.Parts.Back.push(["Gravity Well", 29, -10, 2, -2]);
GameData.Parts.Back.push(["Hang Rope", 30, 0, -30, 2]);
GameData.Parts.Back.push(["Evil Eye Sigma", 31, 15, 20, -5]);
GameData.Parts.Back.push(["Iku's Shawl", 32, 5, 10, -5]);
GameData.Parts.Back.push(["Kurumi's Wings", 33, 5, 10, -5]);
GameData.Parts.Back.push(["Utsuho's Wings", 34, 5, 10, -7]);
GameData.Parts.Back.push(["Orin's Tails", 35, -5, -46, 10]);
GameData.Parts.Back.push(["Heart With Eye", 36, 10, 10, 5]);
GameData.Parts.Back.push(["Gengetsu's Wings", 37, 5, 10, 0]);
GameData.Parts.Back.push(["Sariel's Wings", 38, 5, 10, 0]);
GameData.Parts.Back.push(["Mai's Wings", 39, 5, 10, 0]);
GameData.Parts.Back.push(["Mima's Wings", 40, 5, 10, 0]);
GameData.Parts.Back.push(["Elis' Wings", 41, 5, 10, 0]);
GameData.Parts.Back.push(["Rope+Onbashiras", 42, 5, 10, 0]);
GameData.Parts.Back.push(["Mouse Tail", 43, 5, 10, 0]);
GameData.Parts.Back.push(["Z. Fairy Wings", 44, 5, 10, 0]);
GameData.Parts.Back.push(["Flandre Wings 2", 45, 5, 10, 0]);
GameData.Parts.Back.push(["Turtle Shell", 46, 5, 10, 0]);
GameData.Parts.Back.push(["Ice Fairy Wings 2", 47, 5, 10, 0]);
GameData.Parts.Back.push(["Phoenix Wings 2", 48, 5, 10, 0]);
GameData.Parts.Back.push(["Mystia Wings", 49, 5, 10, 0]);
GameData.Parts.Back.push(["Mystia Wings 2", 50, 5, 10, 0]);
GameData.Parts.Back.push(["Rabbit Tail", 51, 5, 10, 0]);
GameData.Parts.Back.push(["EX-Keine's Tail 2", 52, -5, -8, 0]);
GameData.Parts.Back.push(["Ran Tails", 53, -5, -8, 0]);
GameData.Parts.Back.push(["Transparent Cape", 54, -5, -8, 0]);
GameData.Parts.Back.push(["Chen Tails 2", 55, -5, -8, 0]);
GameData.Parts.Back.push(["Anchor", 56, -5, -8, 0]);
GameData.Parts.Back.push(["Shou's Cloth", 57, -5, -8, 0]);
GameData.Parts.Back.push(["Nue's Wings", 58, -5, -8, 0]);
GameData.Parts.Back.push(["Remilia's Wings 2", 59, -5, -8, 0]);
GameData.Parts.Back.push(["Lily's Wings 2", 60, -5, -8, 0]);
GameData.Parts.Back.push(["Backpack 2", 61, -5, -8, 0]);
GameData.Parts.Back.push(["Byakuren's Cape", 62, -5, -8, 0]);
GameData.Parts.Back.push(["Wriggle Cape 2", 63, -5, -8, 0]);
GameData.Parts.Back.push(["EX-Rumia Wings", 64, -5, -8, 0]);
GameData.Parts.Back.push(["Wolf Tail 2", 65, -5, -8, 4]);
GameData.Parts.Back.push(["Devil Set 2", 66, -5, -8, 4]);
GameData.Parts.Back.push(["Sword", 67, -5, -8, 4]);
GameData.Parts.Back.push(["Swords", 68, -5, -8, 4]);
GameData.Parts.Back.push(["Wolf Tail 2A", 69, -5, -8, 4]);
GameData.Parts.Back.push(["Golden Wings 2", 70, 0, -5, 0]);
GameData.Parts.Back.push(["Tied Bow", 71, 0, -5, 0]);
GameData.Parts.Back.push(["Yuka's Wings", 72, 0, -5, 0]);
GameData.Parts.Back.push(["Sacred Ring 2", 73, 5, 10, -5]);
GameData.Parts.Back.push(["Rope+Onbashiras 2", 74, 5, 10, 0]);
GameData.Parts.Back.push(["Angel's Wings", 75, 0, -5, 0]);
GameData.Parts.Back.push(["Angel's Wing", 76, 5, 10, -5]);
GameData.Parts.Back.push(["Ice Fairy Wings 3", 77, 5, -5, 0]);
GameData.Parts.Back.push(["Shinki's Wings 2", 78, 7, 8, -5]);
GameData.Parts.Back.push(["Shinki's Wings White", 79, 7, 8, -5]);
GameData.Parts.Back.push(["Mima's Wings 2A", 80, 5, -5, 0]);
GameData.Parts.Back.push(["Mima's Wings 2B", 81, 5, -5, 0]);
GameData.Parts.Back.push(["Rengeteki Wings", 82, 5, 10, -3]);
GameData.Parts.Back.push(["Tokiko's Wings 2", 83, 5, -5, 0]);
GameData.Parts.Back.push(["Rengeteki Wings 2", 84, 5, 10, -3]);
GameData.Parts.Back.push(["Sunny Wings", 85, 5, -5, 0]);
GameData.Parts.Back.push(["Star Wings", 86, 5, -5, 0]);
GameData.Parts.Back.push(["Butterfly", 87, 5, -5, 0]);
GameData.Parts.Back.push(["Butterfly (Pink)", 88, 5, -5, 0]);
GameData.Parts.Back.push(["Butterfly (Yellow)", 89, 5, -5, 0]);
GameData.Parts.Back.push(["Butterfly (Green)", 90, 5, -5, 0]);
GameData.Parts.Back.push(["Butterfly (Blue)", 91, 5, -5, 0]);
GameData.Parts.Back.push(["Luna Wings", 92, 5, -5, 0]);
GameData.Parts.Back.push(["Nue's Wings 2", 93, 5, -3, -3]);
GameData.Parts.Back.push(["Ragged Cape", 94, 5, -5, 0]);
GameData.Parts.Back.push(["Ragged Cape w/ Tail", 95, 5, -5, 0]);
GameData.Parts.Back.push(["Yumemi's Cape", 96, 5, -7, 0]);
GameData.Parts.Back.push(["4 Bat Wings", 97, 5, -3, -3]);
GameData.Parts.Back.push(["Pig Tail", 98, 5, -5, 0]);
GameData.Parts.Back.push(["Fox Tail", 99, 5, -5, 0]);
GameData.Parts.Back.push(["Fire Wings", 100, 5, -7, 0]);
GameData.Parts.Back.push(["Jetpack", 101, 5, -7, 0]);
GameData.Parts.Back.push(["Nazrin (Alt)", 102, 5, -7, 0]);
GameData.Parts.Back.push(["4 Bat Wings (Alt)", 103, 5, -7, 0]);
GameData.Parts.Back.push(["4 Angel Wings", 104, 5, -7, 0]);
GameData.Parts.Back.push(["Iku's Shawl 2", 105, 5, 10, -5]);
GameData.Parts.Back.push(["Kisume's Rope", 106, 5, 10, -5]);
GameData.Parts.Back.push(["Tengu Wings 2", 107, 5, 10, -5]);
GameData.Parts.Back.push(["Mystia Wings Blue", 108, 5, 10, -5]);
GameData.Parts.Back.push(["Mystia Wings 2 Blue", 109, 5, 10, -5]);
GameData.Parts.Back.push(["Utsuho's Wings 2", 110, 5, 10, -5]);
GameData.Parts.Back.push(["Orin's Tails 2", 111, 5, 10, -5]);
GameData.Parts.Back.push(["Tiger Tail", 112, 5, 10, -5]);
GameData.Parts.Back.push(["Nail", 113, 5, 10, -5]);
GameData.Parts.Back.push(["Mitori's Sign", 114, 5, 10, -5]);
GameData.Parts.Back.push(["Utsuho's Wings 2 Alt", 115, 5, 10, -5]);
GameData.Parts.Back.push(["Starry Cape", 116, 5, 10, -5]);
GameData.Parts.Back.push(["Wings With Circles", 117, 5, 10, -5]);
GameData.Parts.Back.push(["Kurumi's Wings 2", 118, 5, 10, -5]);
GameData.Parts.Back.push(["Gengetsu's Wings 2", 119, 5, 10, -5]);
GameData.Parts.Back.push(["Sariel's Wings 2", 120, 5, 10, -5]);
GameData.Parts.Back.push(["Dragon Tail (Blue)", 121, 5, 10, -5]);
GameData.Parts.Back.push(["Mai's Wings 2", 122, 5, 10, -5]);
GameData.Parts.Back.push(["Elly's Cape", 123, 5, 10, -5]);
GameData.Parts.Back.push(["Rabbit Tail (Black)", 124, 5, 10, -5]);
GameData.Parts.Back.push(["Small Bat Wings", 125, 5, 10, -5]);
GameData.Parts.Back.push(["Blue Dragon", 126, 5, 10, -5]);
GameData.Parts.Back.push(["Blue Dragon Wings", 127, 5, 10, -5]);
GameData.Parts.Back.push(["Green Dragon Wings", 128, 5, 10, -5]);
GameData.Parts.Back.push(["Green Dragon", 129, 5, 10, -5]);
GameData.Parts.Back.push(["Green Dragon Tail", 130, 5, 10, -5]);
GameData.Parts.Back.push(["Black Dragon Wings", 131, 5, 10, -5]);
GameData.Parts.Back.push(["Seiga Cloth", 132, 5, 10, -5]);
GameData.Parts.Back.push(["Mamizou Tail", 133, 5, 10, -5]);
GameData.Parts.Back.push("random");
GameData.Parts.Acc = new Array();
GameData.Parts.Acc.push("none");
GameData.Parts.Acc.push(["Glasses", 1, 0, 0, 0]);
GameData.Parts.Acc.push(["Monocle", 2, -6, -4, 0]);
GameData.Parts.Acc.push(["Black Mask", 3, 0, -10, 0]);
GameData.Parts.Acc.push(["Flu Mask", 4, 0, -6, 0]);
GameData.Parts.Acc.push(["Amulet", 5, 0, 8, 0]);
GameData.Parts.Acc.push(["GAR Shades", 6, 0, 0, 0]);
GameData.Parts.Acc.push(["Sun Glasses", 7, 0, 0, 0]);
GameData.Parts.Acc.push(["Rectangle Glasses", 8, 0, 0, 0]);
GameData.Parts.Acc.push(["Blush", 9, -4, -10, 6]);
GameData.Parts.Acc.push(["3D Glasses", 10, 0, 0, 0]);
GameData.Parts.Acc.push(["Knife", 11, 0, 22, 0]);
GameData.Parts.Acc.push(["Moustache", 12, 0, 0, 0]);
GameData.Parts.Acc.push(["Eye Patch", 13, 0, 3, 0]);
GameData.Parts.Acc.push(["Cross Scar", 14, 0, 0, 0]);
GameData.Parts.Acc.push(["Big Glasses 1", 15, 0, 0, 0]);
GameData.Parts.Acc.push(["Big Glasses 2", 16, 0, 0, 0]);
GameData.Parts.Acc.push(["Big Glasses 3", 17, 0, 0, 0]);
GameData.Parts.Acc.push(["Scarf (Pink)", 18, 10, -18, 0]);
GameData.Parts.Acc.push(["Knight Visor", 19, 5, 2, -5]);
GameData.Parts.Acc.push(["Melody", 20, -15, 10, -5]);
GameData.Parts.Acc.push(["Flames", 21, 8, 5, -10]);
GameData.Parts.Acc.push(["Stylish Glasses", 22, 0, -3, 0]);
GameData.Parts.Acc.push(["Happiness", 23, -5, 10, -10]);
GameData.Parts.Acc.push(["Censored", 24, 0, 0, 0]);
GameData.Parts.Acc.push(["Power Up!", 25, 10, 5, -14]);
GameData.Parts.Acc.push(["Twirly", 26, -20, 13, 0]);
GameData.Parts.Acc.push(["Wanted", 27, 11, 5, -13]);
GameData.Parts.Acc.push(["Eyebrows", 28, 0, 3, 0]);
GameData.Parts.Acc.push(["Happy Mask", 29, 0, 0, 0]);
GameData.Parts.Acc.push(["Faceguard", 30, 3, 0, -3]);
GameData.Parts.Acc.push(["Mole", 31, -5, 0, 0]);
GameData.Parts.Acc.push(["Cross Bands", 32, 10, 0, 0]);
GameData.Parts.Acc.push(["Darkness", 33, 10, 5, -15]);
GameData.Parts.Acc.push(["Crow", 34, 0, 23, 0]);
GameData.Parts.Acc.push(["Tengu Scarf 1", 35, 4, -13, -5]);
GameData.Parts.Acc.push(["Tengu Scarf 2", 36, 4, -13, -5]);
GameData.Parts.Acc.push(["Wolf Ears", 37, 2, 15, -3]);
GameData.Parts.Acc.push(["Scouter", 38, -7, 3, 0]);
GameData.Parts.Acc.push(["Gundam", 39, 5, -4, -10]);
GameData.Parts.Acc.push(["Doll", 40, 7, 23, 0]);
GameData.Parts.Acc.push(["Camo Make-up", 41, 0, -3, 0]);
GameData.Parts.Acc.push(["Clever Disguise", 42, 0, 0, 0]);
GameData.Parts.Acc.push(["Worry Brows", 43, 0, 4, 0]);
GameData.Parts.Acc.push(["Marisa", 44, -10, 10, -8]);
GameData.Parts.Acc.push(["Zap!", 45, 10, 5, -14]);
GameData.Parts.Acc.push(["Basket", 46, 4, -25, 0]);
GameData.Parts.Acc.push(["Visor", 47, 2, 10, 0]);
GameData.Parts.Acc.push(["More Glasses", 48, 0, 0, 0]);
GameData.Parts.Acc.push(["White Beard", 49, 0, -13, 0]);
GameData.Parts.Acc.push(["Bandit Mask", 50, 0, -11, 0]);
GameData.Parts.Acc.push(["Sunny", 51, -12, 7, -9]);
GameData.Parts.Acc.push(["Sweat Drop", 52, 13, 0, 0]);
GameData.Parts.Acc.push(["Toast", 53, 0, -15, 0]);
GameData.Parts.Acc.push(["Fish", 54, -3, -17, 0]);
GameData.Parts.Acc.push(["Rain Cloud", 55, -5, 12, -10]);
GameData.Parts.Acc.push(["Bandage", 56, 2, 6, 0]);
GameData.Parts.Acc.push(["Shout", 57, -7, 0, -10]);
GameData.Parts.Acc.push(["Angry Eyebrows", 58, 0, 3, 0]);
GameData.Parts.Acc.push(["Youki's Beard", 59, 0, -13, 0]);
GameData.Parts.Acc.push(["Inner Tube", 60, 0, -30, 2]);
GameData.Parts.Acc.push(["Satori's 3rd Eye", 61, 8, -2, -10]);
GameData.Parts.Acc.push(["Police Badge", 62, 0, -10, 0]);
GameData.Parts.Acc.push(["Letty's Pin", 63, 0, -10, 0]);
GameData.Parts.Acc.push(["Small Glasses", 64, 0, 0, 0]);
GameData.Parts.Acc.push(["Red Mark", 65, 0, -10, 0]);
GameData.Parts.Acc.push(["Koishi's 3rd Eye", 66, 5, -5, -10]);
GameData.Parts.Acc.push(["Smoke Pipe", 67, -5, 0, -5]);
GameData.Parts.Acc.push(["Satsuki Beads", 68, 3, 13, -5]);
GameData.Parts.Acc.push(["Advent Cirno", 69, 3, -11, -7]);
GameData.Parts.Acc.push(["Cat (Black)", 70, 6, 11, -10]);
GameData.Parts.Acc.push(["Cat (Yellow)", 71, 6, 11, -10]);
GameData.Parts.Acc.push(["Cat (White)", 72, 6, 11, -10]);
GameData.Parts.Acc.push(["Carrot charm", 73, 6, 11, -5]);
GameData.Parts.Acc.push(["Koishi's 3rd Eye 2", 74, 5, -5, -10]);
GameData.Parts.Acc.push(["Rose patch (Red)", 75, 5, -5, -5]);
GameData.Parts.Acc.push(["Rose patch (Purple)", 76, 5, -5, -5]);
GameData.Parts.Acc.push(["Pink Bow", 77, 5, -5, -5]);
GameData.Parts.Acc.push(["White Bow", 78, 5, -5, -5]);
GameData.Parts.Acc.push(["Scarf (Pink 2)", 79, 5, -5, -5]);
GameData.Parts.Acc.push(["Dog Leash", 80, 5, -5, -5]);
GameData.Parts.Acc.push(["Momizi Ears", 81, 5, 10, -5]);
GameData.Parts.Acc.push(["Ahoge", 82, 5, 10, -5]);
GameData.Parts.Acc.push(["Antennae Hair", 83, 5, 10, -5]);
GameData.Parts.Acc.push(["Cigarette", 84, 5, -5, -5]);
GameData.Parts.Acc.push(["Cigar", 85, 5, -5, -5]);
GameData.Parts.Acc.push(["Elf Ears", 86, 5, -2, -5]);
GameData.Parts.Acc.push(["Trenchcoat (Red)", 87, 5, -10, -5]);
GameData.Parts.Acc.push(["Aviator Shades", 88, 5, -2, -5]);
GameData.Parts.Acc.push(["Red Armband", 89, 5, -5, -5]);
GameData.Parts.Acc.push(["Headband+Mantle", 90, 5, -5, -5]);
GameData.Parts.Acc.push(["Anger Vein", 91, 5, 3, -5]);
GameData.Parts.Acc.push(["Wooden Armor", 92, 5, -14, -5]);
GameData.Parts.Acc.push(["Rectangle Glasses 2", 93, 5, -5, -5]);
GameData.Parts.Acc.push(["Eyepatch Flipped", 94, 5, 5, -5]);
GameData.Parts.Acc.push(["Trenchcoat (Purple)", 95, 5, -10, -5]);
GameData.Parts.Acc.push(["Handkerchief", 96, 5, -14, -5]);
GameData.Parts.Acc.push(["Kitsune Mask", 97, 5, -5, -5]);
GameData.Parts.Acc.push(["Evil Moustache", 98, 5, -4, -5]);
GameData.Parts.Acc.push(["Tewi Ears", 99, 5, 10, -5]);
GameData.Parts.Acc.push(["Reisen Ears", 100, 5, 10, -5]);
GameData.Parts.Acc.push(["Antennae", 101, 5, 10, -5]);
GameData.Parts.Acc.push(["Scarf (Red)", 102, 5, -14, -5]);
GameData.Parts.Acc.push(["Red Belt", 103, 5, -10, -5]);
GameData.Parts.Acc.push(["Red Scarf+Belt", 104, 5, -14, -5]);
GameData.Parts.Acc.push(["Collar", 105, 5, -5, -5]);
GameData.Parts.Acc.push(["Tewi Ears 2", 106, 5, 10, -5]);
GameData.Parts.Acc.push(["Reisen Ears 2", 107, 5, 10, -5]);
GameData.Parts.Acc.push(["Reisen II Ears 2", 108, 5, 10, -5]);
GameData.Parts.Acc.push(["Reisen II Ears", 109, 5, 10, -5]);
GameData.Parts.Acc.push(["Stubble", 110, 5, -5, -5]);
GameData.Parts.Acc.push(["Trenchcoat (Black)", 111, 5, -8, -5]);
GameData.Parts.Acc.push(["Jacket (Blue)", 112, 5, -14, -5]);
GameData.Parts.Acc.push(["Messenger Bag", 113, 5, -15, -5]);
GameData.Parts.Acc.push(["White Mask", 114, 5, -1, -5]);
GameData.Parts.Acc.push(["Robot Ears", 115, 5, -1, -5]);
GameData.Parts.Acc.push(["Scarf (Orange)", 116, 5, -5, -5]);
GameData.Parts.Acc.push(["Muzzle", 117, 5, -5, -5]);
GameData.Parts.Acc.push(["Mario Moustache", 118, 5, -5, -5]);
GameData.Parts.Acc.push(["Mario Moustache 2", 119, 5, -5, -5]);
GameData.Parts.Acc.push(["Night Vision 1", 120, 5, -2, -5]);
GameData.Parts.Acc.push(["Night Vision 2", 121, 5, 5, -5]);
GameData.Parts.Acc.push(["Satori's 3rd Eye 2", 122, 8, -2, -10]);
GameData.Parts.Acc.push(["Face Blush", 123, 8, -2, -10]);
GameData.Parts.Acc.push(["Aya Scarf+Ears", 124, 8, -2, -10]);
GameData.Parts.Acc.push(["Koishi's 3rd Eye 2", 125, 8, -2, -10]);
GameData.Parts.Acc.push(["Star Necklace", 126, 8, -5, -3]);
GameData.Parts.Acc.push(["Trenchcoat (White)", 127, 5, -8, -5]);
GameData.Parts.Acc.push(["Scarf (Green)", 128, 5, -5, -5]);
GameData.Parts.Acc.push(["Scarf (White)", 129, 5, -5, -5]);
GameData.Parts.Acc.push(["Aya Scarf", 130, 8, -2, -10]);
GameData.Parts.Acc.push(["Koishi's 3rd Eye 2 Open", 131, 8, -2, -10]);
GameData.Parts.Acc.push(["Shutter Shades", 132, 8, -2, -1]);
GameData.Parts.Acc.push(["Dawn Scarf", 133, 8, -2, -1]);
GameData.Parts.Acc.push(["Blue Scarf", 134, 8, -2, -1]);
GameData.Parts.Acc.push(["Pink Glasses", 135, 8, -2, -1]);
GameData.Parts.Acc.push(["Square Glasses", 136, 8, -2, -1]);
GameData.Parts.Acc.push(["Argyle Vest", 137, 8, -2, -1]);
GameData.Parts.Acc.push(["Youki's Beard 2", 138, 0, -13, 0]);
GameData.Parts.Acc.push(["Circular Glasses", 139, 0, 0, 0]);
GameData.Parts.Acc.push(["White-Rimmed Shades", 140, 0, 0, 0]);
GameData.Parts.Acc.push(["Monocle+Stache", 141, 0, 0, 0]);
GameData.Parts.Acc.push(["Monocle 2", 142, 0, 0, 0]);
GameData.Parts.Acc.push(["Tewi Ears+Tail (Black)", 143, 0, 5, 0]);
GameData.Parts.Acc.push(["Red Mark 2", 144, 0, -10, 0]);
GameData.Parts.Acc.push(["Ran's Ears", 145, 0, 15, 0]);
GameData.Parts.Acc.push(["Reisen Ears+Tail (Black)", 146, 0, 15, 0]);
GameData.Parts.Acc.push(["Red-white scarf", 147, 0, -10, 0]);
GameData.Parts.Acc.push(["Taped Mouth", 148, 0, -10, 0]);
GameData.Parts.Acc.push(["Advent Cirno (Rev)", 149, 0, -16, 0]);
GameData.Parts.Acc.push(["Tengu Mask", 150, 0, -5, -2]);
GameData.Parts.Acc.push(["Satori's 3rd Eye 2 Closed", 151, 8, -2, -10]);
GameData.Parts.Acc.push(["Yoshika Arms", 152, 0, -10, 0]);
GameData.Parts.Acc.push(["Yoshika Seal", 153, 0, 3, 0]);
GameData.Parts.Acc.push(["Miko's Sword", 154, 0, 3, 0]);
GameData.Parts.Acc.push(["Glasses (Mamizou)", 155, 0, 3, 0]);
GameData.Parts.Acc.push("random");
GameData.Parts.Body = new Array();
GameData.Parts.Body.push("none");
GameData.Parts.Body.push(["Meiling", 1, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu", 2, 0, 0, 0]);
GameData.Parts.Body.push(["Marisa", 3, 0, 0, 0]);
GameData.Parts.Body.push(["Sakuya", 4, 0, 0, 0]);
GameData.Parts.Body.push(["Yukari", 5, 0, 0, 0]);
GameData.Parts.Body.push(["Flandre", 6, 0, 0, 0]);
GameData.Parts.Body.push(["Yuyuko", 7, 0, 0, 0]);
GameData.Parts.Body.push(["Kaguya", 8, 0, 0, 0]);
GameData.Parts.Body.push(["Cirno", 9, 0, 0, 0]);
GameData.Parts.Body.push(["Eirin", 10, 0, 0, 0]);
GameData.Parts.Body.push(["Youmu", 11, 0, 0, 0]);
GameData.Parts.Body.push(["Patchouli", 12, 0, 0, 0]);
GameData.Parts.Body.push(["Alice", 13, 0, 0, 0]);
GameData.Parts.Body.push(["Reisen", 14, 0, 0, 0]);
GameData.Parts.Body.push(["Mokou", 15, 0, 0, 0]);
GameData.Parts.Body.push(["Mystia", 16, 0, 0, 0]);
GameData.Parts.Body.push(["Tewi", 17, 0, 0, 0]);
GameData.Parts.Body.push(["Keine", 18, 0, 0, 0]);
GameData.Parts.Body.push(["Ran", 19, 0, 0, 0]);
GameData.Parts.Body.push(["Letty", 20, 0, 0, 0]);
GameData.Parts.Body.push(["Chen", 21, 0, 0, 0]);
GameData.Parts.Body.push(["Suika", 22, 0, 0, 0]);
GameData.Parts.Body.push(["Remilia", 23, 0, 0, 0]);
GameData.Parts.Body.push(["Lily White", 24, 0, 0, 0]);
GameData.Parts.Body.push(["Lily Black", 25, 0, 0, 0]);
GameData.Parts.Body.push(["Komachi", 26, 0, 0, 0]);
GameData.Parts.Body.push(["Nitori", 27, 0, 0, 0]);
GameData.Parts.Body.push(["Sikieiki", 28, 0, 0, 0]);
GameData.Parts.Body.push(["Wriggle", 29, 0, 0, 0]);
GameData.Parts.Body.push(["Rumia", 30, 0, 0, 0]);
GameData.Parts.Body.push(["Aya", 31, 0, 0, 0]);
GameData.Parts.Body.push(["Momizi", 32, 0, 0, 0]);
GameData.Parts.Body.push(["Koakuma", 33, 0, 0, 0]);
GameData.Parts.Body.push(["Lunasa", 34, 0, 0, 0]);
GameData.Parts.Body.push(["Merlin", 35, 0, 0, 0]);
GameData.Parts.Body.push(["Lyrica", 36, 0, 0, 0]);
GameData.Parts.Body.push(["Daiyousei", 37, 0, 0, 0]);
GameData.Parts.Body.push(["Medicine", 38, 0, 0, 0]);
GameData.Parts.Body.push(["Keine (EX)", 39, 0, 0, 0]);
GameData.Parts.Body.push(["Yuka", 40, 0, 0, 0]);
GameData.Parts.Body.push(["Suwako", 41, 0, 0, 0]);
GameData.Parts.Body.push(["Hina", 42, 0, 0, 0]);
GameData.Parts.Body.push(["Sanae", 43, 0, 0, 0]);
GameData.Parts.Body.push(["Kanako", 44, 0, 0, 0]);
GameData.Parts.Body.push(["Minoriko", 45, 0, 0, 0]);
GameData.Parts.Body.push(["Shizuha", 46, 0, 0, 0]);
GameData.Parts.Body.push(["Shinki", 47, 0, 0, 0]);
GameData.Parts.Body.push(["Mima", 48, 0, 0, 0]);
GameData.Parts.Body.push(["Rinnosuke", 49, 0, 0, 0]);
GameData.Parts.Body.push(["Tokiko", 50, 0, 0, 0]);
GameData.Parts.Body.push(["Sunny Milk", 51, 0, 0, 0]);
GameData.Parts.Body.push(["Star Sapphire", 52, 0, 0, 0]);
GameData.Parts.Body.push(["Luna Child", 53, 0, 0, 0]);
GameData.Parts.Body.push(["Akyu", 54, 0, 0, 0]);
GameData.Parts.Body.push(["Renko", 55, 0, 0, 0]);
GameData.Parts.Body.push(["Maribel", 56, 0, 0, 0]);
GameData.Parts.Body.push(["Chiyuri", 57, 0, 0, 0]);
GameData.Parts.Body.push(["Yumemi", 58, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (PC-98)", 59, 0, 0, 0]);
GameData.Parts.Body.push(["Yamame", 60, 0, 0, 0]);
GameData.Parts.Body.push(["Tenshi", 61, 0, 0, 0]);
GameData.Parts.Body.push(["Iku", 62, 0, 0, 0]);
GameData.Parts.Body.push(["Yuugi", 63, 0, 0, 0]);
GameData.Parts.Body.push(["Kisume", 64, 0, -4, -5]);
GameData.Parts.Body.push(["Parsee", 65, 0, 0, 0]);
GameData.Parts.Body.push(["Yorihime", 66, 0, 0, 0]);
GameData.Parts.Body.push(["Toyohime", 67, 0, 0, 0]);
GameData.Parts.Body.push(["Marisa (PC-98)", 68, 0, 0, 0]);
GameData.Parts.Body.push(["Youki", 69, 0, 0, 0]);
GameData.Parts.Body.push(["Alice (PC-98)", 70, 0, 0, 0]);
GameData.Parts.Body.push(["Kurumi", 71, 0, 0, 0]);
GameData.Parts.Body.push(["Luize", 72, 0, 0, 0]);
GameData.Parts.Body.push(["Utsuho", 73, 0, 0, 0]);
GameData.Parts.Body.push(["Orin", 74, 0, 0, 0]);
GameData.Parts.Body.push(["Satori", 75, 0, 0, 0]);
GameData.Parts.Body.push(["Koishi", 76, 0, 0, 0]);
GameData.Parts.Body.push(["Yumeko", 77, 0, 0, 0]);
GameData.Parts.Body.push(["Ruukoto", 78, 0, 0, 0]);
GameData.Parts.Body.push(["Mugetsu", 79, 0, 0, 0]);
GameData.Parts.Body.push(["VIVIT", 80, 0, 0, 0]);
GameData.Parts.Body.push(["Gengetsu", 81, 0, 0, 0]);
GameData.Parts.Body.push(["Sariel", 82, 0, 0, 0]);
GameData.Parts.Body.push(["Konngara", 83, 0, 0, 0]);
GameData.Parts.Body.push(["Kotohime", 84, 0, 0, 0]);
GameData.Parts.Body.push(["Orange", 85, 0, 0, 0]);
GameData.Parts.Body.push(["Rikako", 86, 0, 0, 0]);
GameData.Parts.Body.push(["Rika", 87, 0, 0, 0]);
GameData.Parts.Body.push(["Yuki", 88, 0, 0, 0]);
GameData.Parts.Body.push(["Mai", 89, 0, 0, 0]);
GameData.Parts.Body.push(["Ellen", 90, 0, 0, 0]);
GameData.Parts.Body.push(["Kana", 91, 0, 0, 0]);
GameData.Parts.Body.push(["Elly", 92, 0, 0, 0]);
GameData.Parts.Body.push(["Sara", 93, 0, 0, 0]);
GameData.Parts.Body.push(["Meira", 94, 0, 0, 0]);
GameData.Parts.Body.push(["Elis", 95, 0, 0, 0]);
GameData.Parts.Body.push(["Shingyoku F", 96, 0, 0, 0]);
GameData.Parts.Body.push(["Shingyoku M", 97, 0, 0, 0]);
GameData.Parts.Body.push(["Yuka (PJ's)", 98, 0, 0, 0]);
GameData.Parts.Body.push(["Yukari (PCB)", 99, 0, 0, 0]);
GameData.Parts.Body.push(["Marisa (SA)", 100, 0, 0, 0]);
GameData.Parts.Body.push(["Reisen (SWR)", 101, 0, 0, 0]);
GameData.Parts.Body.push(["Nazrin", 102, 0, 0, 0]);
GameData.Parts.Body.push(["Kogasa", 103, 0, 0, 0]);
GameData.Parts.Body.push(["Ichirin", 104, 0, 0, 0]);
GameData.Parts.Body.push(["Marisa (UFO)", 105, 0, 0, 0]);
GameData.Parts.Body.push(["Zombie Fairy", 106, 0, 0, 0]);
GameData.Parts.Body.push(["Shanghai", 107, 0, 0, 0]);
GameData.Parts.Body.push(["Rin Satsuki", 108, 0, 0, 0]);
GameData.Parts.Body.push(["Layla", 109, 0, 0, 0]);
GameData.Parts.Body.push(["Meimu", 110, 0, 0, 0]);
GameData.Parts.Body.push(["Meiling (2)", 111, 0, 0, 0]);
GameData.Parts.Body.push(["Lie Meiling", 112, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (2)", 113, 0, 0, 0]);
GameData.Parts.Body.push(["Marisa (PCB)", 114, 0, 0, 0]);
GameData.Parts.Body.push(["Sakuya (2)", 115, 0, 0, 0]);
GameData.Parts.Body.push(["Yukari (IaMP)", 116, 0, 0, 0]);
GameData.Parts.Body.push(["Flandre (2)", 117, 0, 0, 0]);
GameData.Parts.Body.push(["Yuyuko (2)", 118, 0, 0, 0]);
GameData.Parts.Body.push(["Kaguya (2)", 119, 0, 0, 0]);
GameData.Parts.Body.push(["Cirno (2)", 120, 0, 0, 0]);
GameData.Parts.Body.push(["Eirin (2)", 121, 0, 0, 0]);
GameData.Parts.Body.push(["Youmu (2)", 122, 0, 0, 0]);
GameData.Parts.Body.push(["Patchouli (2)", 123, 0, 0, 0]);
GameData.Parts.Body.push(["Alice (2A)", 124, 0, 0, 0]);
GameData.Parts.Body.push(["Alice (2B)", 125, 0, 0, 0]);
GameData.Parts.Body.push(["Reisen (2)", 126, 0, 0, 0]);
GameData.Parts.Body.push(["Mokou (2)", 127, 0, 0, 0]);
GameData.Parts.Body.push(["Mystia (2A)", 128, 0, 0, 0]);
GameData.Parts.Body.push(["Mystia (2B)", 129, 0, 0, 0]);
GameData.Parts.Body.push(["Tewi (2)", 130, 0, 0, 0]);
GameData.Parts.Body.push(["Keine (2)", 131, 0, 0, 0]);
GameData.Parts.Body.push(["Keine (EX2)", 132, 0, 0, 0]);
GameData.Parts.Body.push(["Ran (2)", 133, 0, 0, 0]);
GameData.Parts.Body.push(["Letty (2)", 134, 0, 0, 0]);
GameData.Parts.Body.push(["Chen (2)", 135, 0, 0, 0]);
GameData.Parts.Body.push(["Suika (2)", 136, 0, 0, 0]);
GameData.Parts.Body.push(["Murasa", 137, 0, 0, 0]);
GameData.Parts.Body.push(["Shou", 138, 0, 0, 0]);
GameData.Parts.Body.push(["Byakuren", 139, 0, 0, 0]);
GameData.Parts.Body.push(["Nue", 140, 0, 0, 0]);
GameData.Parts.Body.push(["Remilia (2)", 141, 0, 0, 0]);
GameData.Parts.Body.push(["Lily White (2)", 142, 0, 0, 0]);
GameData.Parts.Body.push(["Lily Black (2)", 143, 0, 0, 0]);
GameData.Parts.Body.push(["Komachi (2)", 144, 0, 0, 0]);
GameData.Parts.Body.push(["Nitori (2)", 145, 0, 0, 0]);
GameData.Parts.Body.push(["Plain Red", 146, 0, 0, 0]);
GameData.Parts.Body.push(["Sikieiki (2)", 147, 0, 0, 0]);
GameData.Parts.Body.push(["Wriggle (2)", 148, 0, 0, 0]);
GameData.Parts.Body.push(["Rumia (2)", 149, 0, 0, 0]);
GameData.Parts.Body.push(["Aya (2A)", 150, 0, 0, 0]);
GameData.Parts.Body.push(["Aya (2B)", 151, 0, 0, 0]);
GameData.Parts.Body.push(["Momizi (2)", 152, 0, 0, 0]);
GameData.Parts.Body.push(["Koakuma (2)", 153, 0, 0, 0]);
GameData.Parts.Body.push(["Marisa (2)", 154, 0, 0, 0]);
GameData.Parts.Body.push(["Lunasa (2)", 155, 0, 0, 0]);
GameData.Parts.Body.push(["Merlin (2)", 156, 0, 0, 0]);
GameData.Parts.Body.push(["Lyrica (2)", 157, 0, 0, 0]);
GameData.Parts.Body.push(["Sakuya (Magical)", 158, 0, 0, 0]);
GameData.Parts.Body.push(["Sanae (Magical)", 159, 0, 0, 0]);
GameData.Parts.Body.push(["Daiyousei (2)", 160, 0, 0, 0]);
GameData.Parts.Body.push(["EXHF", 161, 0, 0, 0]);
GameData.Parts.Body.push(["Medicine (2)", 162, 0, 0, 0]);
GameData.Parts.Body.push(["Yuka (2)", 163, 0, 0, 0]);
GameData.Parts.Body.push(["Santa", 164, 0, 0, 0]);
GameData.Parts.Body.push(["Suwako (2)", 165, 0, 0, 0]);
GameData.Parts.Body.push(["Hina (2)", 166, 0, 0, 0]);
GameData.Parts.Body.push(["Sanae (2)", 167, 0, 0, 0]);
GameData.Parts.Body.push(["Kanako (2)", 168, 0, 0, 0]);
GameData.Parts.Body.push(["Minoriko (2)", 169, 0, 0, 0]);
GameData.Parts.Body.push(["Shizuha (2)", 170, 0, 0, 0]);
GameData.Parts.Body.push(["Shinki (2)", 171, 0, 0, 0]);
GameData.Parts.Body.push(["Mima (2)", 172, 0, 0, 0]);
GameData.Parts.Body.push(["Rinnosuke (2)", 173, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (2P)", 174, 0, 0, 0]);
GameData.Parts.Body.push(["Mima (HRtP)", 175, 0, 0, 0]);
GameData.Parts.Body.push(["Rengeteki", 176, 0, 0, 0]);
GameData.Parts.Body.push(["Murasa (Alt)", 177, 0, 0, 0]);
GameData.Parts.Body.push(["Blue Uniform", 178, 0, 0, 0]);
GameData.Parts.Body.push(["Tokiko (2)", 179, 0, 0, 0]);
GameData.Parts.Body.push(["Coat (Black)", 180, 0, 0, 0]);
GameData.Parts.Body.push(["Sunny Milk (2)", 181, 0, 0, 0]);
GameData.Parts.Body.push(["Star Sapphire (2)", 182, 0, 0, 0]);
GameData.Parts.Body.push(["Alice (in W)", 183, 0, 0, 0]);
GameData.Parts.Body.push(["Hatate", 184, 0, 0, 0]);
GameData.Parts.Body.push(["Luna Child (2)", 185, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (EoSD)", 186, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (PCB)", 187, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (PoFV)", 188, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (SA)", 189, 0, 0, 0]);
GameData.Parts.Body.push(["Coat (Brown)", 190, 0, 0, 0]);
GameData.Parts.Body.push(["Maid (Black)", 191, 0, 0, 0]);
GameData.Parts.Body.push(["All White", 192, 0, 0, 0]);
GameData.Parts.Body.push(["Blue Suit", 193, 0, 0, 0]);
GameData.Parts.Body.push(["Akyu (2)", 194, 0, 0, 0]);
GameData.Parts.Body.push(["Coat (Red)", 195, 0, 0, 0]);
GameData.Parts.Body.push(["Renko (2)", 196, 0, 0, 0]);
GameData.Parts.Body.push(["Butler", 197, 0, 0, 0]);
GameData.Parts.Body.push(["Maribel (2)", 198, 0, 0, 0]);
GameData.Parts.Body.push(["Link Tunic", 199, 0, 0, 0]);
GameData.Parts.Body.push(["Teacher", 200, 0, 0, 0]);
GameData.Parts.Body.push(["Maid (Red)", 201, 0, 0, 0]);
GameData.Parts.Body.push(["Yamame (2)", 202, 0, 0, 0]);
GameData.Parts.Body.push(["Chiyuri (2)", 203, 0, 0, 0]);
GameData.Parts.Body.push(["Sukumizu", 204, 0, 0, 0]);
GameData.Parts.Body.push(["Yumemi (2)", 205, 0, 0, 0]);
GameData.Parts.Body.push(["Pink Dress", 206, 0, 0, 0]);
GameData.Parts.Body.push(["Brown Dress", 207, 0, 0, 0]);
GameData.Parts.Body.push(["Mystia (Black)", 208, 0, 0, 0]);
GameData.Parts.Body.push(["Remilia (THVania)", 209, 0, 0, 0]);
GameData.Parts.Body.push(["Red Overalls", 210, 0, 0, 0]);
GameData.Parts.Body.push(["Kimono (Blank)", 211, 0, 0, 0]);
GameData.Parts.Body.push(["Kimono (Pink)", 212, 0, 0, 0]);
GameData.Parts.Body.push(["Cirno (Fire)", 213, 0, 0, 0]);
GameData.Parts.Body.push(["Camo (Green)", 214, 0, 0, 0]);
GameData.Parts.Body.push(["Reisen Suit", 215, 0, 0, 0]);
GameData.Parts.Body.push(["Black Suit", 216, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (PC-98 2A)", 217, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (PC-98 2B)", 218, 0, 0, 0]);
GameData.Parts.Body.push(["Kimono (Indigo)", 219, 0, 0, 0]);
GameData.Parts.Body.push(["Camo (Grey)", 220, 0, 0, 0]);
GameData.Parts.Body.push(["Yuka (2 Alt)", 221, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (PC-98 2C)", 222, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (PC-98 2 Blue)", 223, 0, 0, 0]);
GameData.Parts.Body.push(["Tenshi (2)", 224, 0, 0, 0]);
GameData.Parts.Body.push(["Maid (Dark Blue)", 225, 0, 0, 0]);
GameData.Parts.Body.push(["Iku (2)", 226, 0, 0, 0]);
GameData.Parts.Body.push(["Wonderland Rabbit", 227, 0, 0, 0]);
GameData.Parts.Body.push(["Black", 228, 0, 0, 0]);
GameData.Parts.Body.push(["Suika (2 Alt)", 229, 0, 0, 0]);
GameData.Parts.Body.push(["Coat (Green)", 230, 0, 0, 0]);
GameData.Parts.Body.push(["Coat (Purple)", 231, 0, 0, 0]);
GameData.Parts.Body.push(["Yuugi (2)", 232, 0, 0, 0]);
GameData.Parts.Body.push(["Kisume (2)", 233, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu Suit", 234, 0, 0, 0]);
GameData.Parts.Body.push(["Red Suit", 235, 0, 0, 0]);
GameData.Parts.Body.push(["China Dress", 236, 0, 0, 0]);
GameData.Parts.Body.push(["Parsee (2)", 237, 0, 0, 0]);
GameData.Parts.Body.push(["Red", 238, 0, 0, 0]);
GameData.Parts.Body.push(["Doctor", 239, 0, 0, 0]);
GameData.Parts.Body.push(["Utsuho (2)", 240, 0, 0, 0]);
GameData.Parts.Body.push(["Coat (Blue)", 241, 0, 0, 0]);
GameData.Parts.Body.push(["Coat (White)", 242, 0, 0, 0]);
GameData.Parts.Body.push(["Casual", 243, 0, 0, 0]);
GameData.Parts.Body.push(["Orin (2)", 244, 0, 0, 0]);
GameData.Parts.Body.push(["Black Robe", 245, 0, 0, 0]);
GameData.Parts.Body.push(["EE5F00", 246, 0, 0, 0]);
GameData.Parts.Body.push(["FFFF1A", 247, 0, 0, 0]);
GameData.Parts.Body.push(["71BB00", 248, 0, 0, 0]);
GameData.Parts.Body.push(["00BB5E", 249, 0, 0, 0]);
GameData.Parts.Body.push(["00A9BB", 250, 0, 0, 0]);
GameData.Parts.Body.push(["1AE9FF", 251, 0, 0, 0]);
GameData.Parts.Body.push(["1A76FF", 252, 0, 0, 0]);
GameData.Parts.Body.push(["91BDFF", 253, 0, 0, 0]);
GameData.Parts.Body.push(["AD77FF", 254, 0, 0, 0]);
GameData.Parts.Body.push(["893CFF", 255, 0, 0, 0]);
GameData.Parts.Body.push(["D83CFF", 256, 0, 0, 0]);
GameData.Parts.Body.push(["9D9D9D", 257, 0, 0, 0]);
GameData.Parts.Body.push(["6A6A6A", 258, 0, 0, 0]);
GameData.Parts.Body.push(["404040", 259, 0, 0, 0]);
GameData.Parts.Body.push(["Utsuho (Alt)", 260, 0, 0, 0]);
GameData.Parts.Body.push(["Blue Overalls", 261, 0, 0, 0]);
GameData.Parts.Body.push(["Satori (2A)", 262, 0, 0, 0]);
GameData.Parts.Body.push(["Satori (2B)", 263, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (PC-98 2 Green)", 264, 0, 0, 0]);
GameData.Parts.Body.push(["Alice (2B Alt Pose)", 265, 0, 0, 0]);
GameData.Parts.Body.push(["Koishi (2A)", 266, 0, 0, 0]);
GameData.Parts.Body.push(["Koishi (2B)", 267, 0, 0, 0]);
GameData.Parts.Body.push(["9 Jersey", 268, 0, 0, 0]);
GameData.Parts.Body.push(["9 Jersey (Rev)", 269, 0, 0, 0]);
GameData.Parts.Body.push(["Maid (Green)", 270, 0, 0, 0]);
GameData.Parts.Body.push(["Cirno (2 Alt)", 271, 0, 0, 0]);
GameData.Parts.Body.push(["Kasen", 272, 0, 0, 0]);
GameData.Parts.Body.push(["Coat (Pink)", 273, 0, 0, 0]);
GameData.Parts.Body.push(["Black Clothes", 274, 0, 0, 0]);
GameData.Parts.Body.push(["6 Jersey", 275, 0, 0, 0]);
GameData.Parts.Body.push(["6 Jersey (Rev)", 276, 0, 0, 0]);
GameData.Parts.Body.push(["School Uniform", 277, 0, 0, 0]);
GameData.Parts.Body.push(["Alice (2A Alt Pose)", 278, 0, 0, 0]);
GameData.Parts.Body.push(["Casual 2", 279, 0, 0, 0]);
GameData.Parts.Body.push(["Mitori", 280, 0, 0, 0]);
GameData.Parts.Body.push(["Sasha", 281, 0, 0, 0]);
GameData.Parts.Body.push(["Casual 3", 282, 0, 0, 0]);
GameData.Parts.Body.push(["Tennis Outfit 1", 283, 0, 0, 0]);
GameData.Parts.Body.push(["Tennis Outfit 2", 284, 0, 0, 0]);
GameData.Parts.Body.push(["Green Frilly Dress", 285, 0, 0, 0]);
GameData.Parts.Body.push(["Kimono (Maroon)", 286, 0, 0, 0]);
GameData.Parts.Body.push(["Yorihime (2)", 287, 0, 0, 0]);
GameData.Parts.Body.push(["Toyohime (2)", 288, 0, 0, 0]);
GameData.Parts.Body.push(["Youki (2)", 289, 0, 0, 0]);
GameData.Parts.Body.push(["Alice (PC-98)(2)", 290, 0, 0, 0]);
GameData.Parts.Body.push(["Kurumi (2)", 291, 0, 0, 0]);
GameData.Parts.Body.push(["Marisa (PC-98)(2)", 292, 0, 0, 0]);
GameData.Parts.Body.push(["Luize (2A)", 293, 0, 0, 0]);
GameData.Parts.Body.push(["Luize (2B)", 294, 0, 0, 0]);
GameData.Parts.Body.push(["Yumeko (2)", 295, 0, 0, 0]);
GameData.Parts.Body.push(["Ruukoto (2)", 296, 0, 0, 0]);
GameData.Parts.Body.push(["Casual 4", 297, 0, 0, 0]);
GameData.Parts.Body.push(["Mugetsu (2)", 298, 0, 0, 0]);
GameData.Parts.Body.push(["Gengetsu (2)", 299, 0, 0, 0]);
GameData.Parts.Body.push(["Sariel (2)", 300, 0, 0, 0]);
GameData.Parts.Body.push(["Konngara (2)", 301, 0, 0, 0]);
GameData.Parts.Body.push(["Rainbow Shirt", 302, 0, 0, 0]);
GameData.Parts.Body.push(["Kotohime (2)", 303, 0, 0, 0]);
GameData.Parts.Body.push(["Orange (2)", 304, 0, 0, 0]);
GameData.Parts.Body.push(["Rikako (2A)", 305, 0, 0, 0]);
GameData.Parts.Body.push(["Rikako (2B)", 306, 0, 0, 0]);
GameData.Parts.Body.push(["Rika (2)", 307, 0, 0, 0]);
GameData.Parts.Body.push(["Yuki (2)", 308, 0, 0, 0]);
GameData.Parts.Body.push(["VIVIT (2)", 309, 0, 0, 0]);
GameData.Parts.Body.push(["Kimono (Gold)", 310, 0, 0, 0]);
GameData.Parts.Body.push(["Akius Suit", 311, 0, 0, 0]);
GameData.Parts.Body.push(["Mai (2)", 312, 0, 0, 0]);
GameData.Parts.Body.push(["Ellen (2)", 313, 0, 0, 0]);
GameData.Parts.Body.push(["Kana (2)", 314, 0, 0, 0]);
GameData.Parts.Body.push(["Elly (2)", 315, 0, 0, 0]);
GameData.Parts.Body.push(["Sara (2)", 316, 0, 0, 0]);
GameData.Parts.Body.push(["White/black suit", 317, 0, 0, 0]);
GameData.Parts.Body.push(["Football Uniform", 318, 0, 0, 0]);
GameData.Parts.Body.push(["Football Uniform 9", 319, 0, 0, 0]);
GameData.Parts.Body.push(["Football Uniform 9 (rev)", 320, 0, 0, 0]);
GameData.Parts.Body.push(["Meira (2)", 321, 0, 0, 0]);
GameData.Parts.Body.push(["Elis (2)", 322, 0, 0, 0]);
GameData.Parts.Body.push(["Red Mushroom", 323, 0, 0, 0]);
GameData.Parts.Body.push(["Casual 5", 324, 0, 0, 0]);
GameData.Parts.Body.push(["Shingyoku F (2)", 325, 0, 0, 0]);
GameData.Parts.Body.push(["Shingyoku M (2)", 326, 0, 0, 0]);
GameData.Parts.Body.push(["White/Black Suit 2", 327, 0, 0, 0]);
GameData.Parts.Body.push(["White Suit", 328, 0, 0, 0]);
GameData.Parts.Body.push(["Kimono (Purple)", 329, 0, 0, 0]);
GameData.Parts.Body.push(["Yuka (PJ's 2)", 330, 0, 0, 0]);
GameData.Parts.Body.push(["Yukari (PCB 2)", 331, 0, 0, 0]);
GameData.Parts.Body.push(["White Suit 2", 332, 0, 0, 0]);
GameData.Parts.Body.push(["Nazrin (2)", 333, 0, 0, 0]);
GameData.Parts.Body.push(["Kogasa (2)", 334, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (White)", 335, 0, 0, 0]);
GameData.Parts.Body.push(["Meira (2 Alt)", 336, 0, 0, 0]);
GameData.Parts.Body.push(["Ichirin (2)", 337, 0, 0, 0]);
GameData.Parts.Body.push(["Mummy", 338, 0, 0, 0]);
GameData.Parts.Body.push(["Kimono (Red-White)", 339, 0, 0, 0]);
GameData.Parts.Body.push(["Flame Pants", 340, 0, 0, 0]);
GameData.Parts.Body.push(["Shanghai (2)", 341, 0, 0, 0]);
GameData.Parts.Body.push(["Reimu (Green)", 342, 0, 0, 0]);
GameData.Parts.Body.push(["Kyouko", 343, 0, 0, 0]);
GameData.Parts.Body.push(["Yoshika", 344, 0, 0, 0]);
GameData.Parts.Body.push(["Seiga", 345, 0, 0, 0]);
GameData.Parts.Body.push(["Tojiko", 346, 0, 0, 0]);
GameData.Parts.Body.push(["Futo", 347, 0, 0, 0]);
GameData.Parts.Body.push(["Miko", 348, 0, 0, 0]);
GameData.Parts.Body.push(["Miko (Alt)", 349, 0, 0, 0]);
GameData.Parts.Body.push(["Mamizou", 350, 0, 0, 0]);
GameData.Parts.Body.push("random");
GameData.Parts.Shoes = new Array();
GameData.Parts.Shoes.push("none");
GameData.Parts.Shoes.push(["Meiling", 1, 0, 0, 0]);
GameData.Parts.Shoes.push(["Reimu", 2, 0, 0, 0]);
GameData.Parts.Shoes.push(["Marisa", 3, 0, 0, 0]);
GameData.Parts.Shoes.push(["Sakuya", 4, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yukari", 5, 0, 0, 0]);
GameData.Parts.Shoes.push(["Flandre", 6, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yuyuko", 7, 0, 0, 0]);
GameData.Parts.Shoes.push(["Kaguya", 8, 0, 0, 0]);
GameData.Parts.Shoes.push(["Cirno", 9, 0, 0, 0]);
GameData.Parts.Shoes.push(["Eirin", 10, 0, 0, 0]);
GameData.Parts.Shoes.push(["Youmu", 11, 0, 0, 0]);
GameData.Parts.Shoes.push(["Patchouli", 12, 0, 0, 0]);
GameData.Parts.Shoes.push(["Alice", 13, 0, 0, 0]);
GameData.Parts.Shoes.push(["Reisen", 14, 0, 0, 0]);
GameData.Parts.Shoes.push(["Mokou", 15, 0, 0, 0]);
GameData.Parts.Shoes.push(["Mystia", 16, 0, 0, 0]);
GameData.Parts.Shoes.push(["Tewi", 17, 0, 0, 0]);
GameData.Parts.Shoes.push(["Keine", 18, 0, 0, 0]);
GameData.Parts.Shoes.push(["Ran", 19, 0, 0, 0]);
GameData.Parts.Shoes.push(["Letty", 20, 0, 0, 0]);
GameData.Parts.Shoes.push(["Chen", 21, 0, 0, 0]);
GameData.Parts.Shoes.push(["Suika", 22, 0, 0, 0]);
GameData.Parts.Shoes.push(["Remilia", 23, 0, 0, 0]);
GameData.Parts.Shoes.push(["Lily White", 24, 0, 0, 0]);
GameData.Parts.Shoes.push(["Lily Black", 25, 0, 0, 0]);
GameData.Parts.Shoes.push(["Komachi", 26, 0, 0, 0]);
GameData.Parts.Shoes.push(["Nitori", 27, 0, 0, 0]);
GameData.Parts.Shoes.push(["Sikieiki", 28, 0, 0, 0]);
GameData.Parts.Shoes.push(["Wriggle", 29, 0, 0, 0]);
GameData.Parts.Shoes.push(["Rumia", 30, 0, 0, 0]);
GameData.Parts.Shoes.push(["Aya", 31, 0, 0, 0]);
GameData.Parts.Shoes.push(["Momizi", 32, 0, 0, 0]);
GameData.Parts.Shoes.push(["Koakuma", 33, 0, 0, 0]);
GameData.Parts.Shoes.push(["Lunasa", 34, 0, 0, 0]);
GameData.Parts.Shoes.push(["Merlin", 35, 0, 0, 0]);
GameData.Parts.Shoes.push(["Lyrica", 36, 0, 0, 0]);
GameData.Parts.Shoes.push(["Daiyousei", 37, 0, 0, 0]);
GameData.Parts.Shoes.push(["Medicine", 38, 0, 0, 0]);
GameData.Parts.Shoes.push(["Keine (EX) ", 39, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yuka", 40, 0, 0, 0]);
GameData.Parts.Shoes.push(["Suwako", 41, 0, 0, 0]);
GameData.Parts.Shoes.push(["Hina", 42, 0, 0, 0]);
GameData.Parts.Shoes.push(["Sanae", 43, 0, 0, 0]);
GameData.Parts.Shoes.push(["Kanako", 44, 0, 0, 0]);
GameData.Parts.Shoes.push(["Minoriko", 45, 0, 0, 0]);
GameData.Parts.Shoes.push(["Shizuha", 46, 0, 0, 0]);
GameData.Parts.Shoes.push(["Shinki", 47, 0, 0, 0]);
GameData.Parts.Shoes.push(["Mima", 48, 0, 0, 0]);
GameData.Parts.Shoes.push(["Rinnosuke", 49, 0, 0, 0]);
GameData.Parts.Shoes.push(["Tokiko", 50, 0, 0, 0]);
GameData.Parts.Shoes.push(["Sunny Milk", 51, 0, 0, 0]);
GameData.Parts.Shoes.push(["Star Sapphire", 52, 0, 0, 0]);
GameData.Parts.Shoes.push(["Luna Child", 53, 0, 0, 0]);
GameData.Parts.Shoes.push(["Akyu", 54, 0, 0, 0]);
GameData.Parts.Shoes.push(["Renko", 55, 0, 0, 0]);
GameData.Parts.Shoes.push(["Maribel", 56, 0, 0, 0]);
GameData.Parts.Shoes.push(["Chiyuri", 57, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yumemi", 58, 0, 0, 0]);
GameData.Parts.Shoes.push(["Reimu (PC-98)", 59, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yamame", 60, 0, 0, 0]);
GameData.Parts.Shoes.push(["Tenshi", 61, 0, 0, 0]);
GameData.Parts.Shoes.push(["Iku", 62, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yuugi", 63, 0, 0, 0]);
GameData.Parts.Shoes.push(["Parsee", 64, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yorihime", 65, 0, 0, 0]);
GameData.Parts.Shoes.push(["Toyohime", 66, 0, 0, 0]);
GameData.Parts.Shoes.push(["Marisa (PC-98)", 67, 0, 0, 0]);
GameData.Parts.Shoes.push(["Youki", 68, 0, 0, 0]);
GameData.Parts.Shoes.push(["Alice (PC-98)", 69, 0, 0, 0]);
GameData.Parts.Shoes.push(["Kurumi", 70, 0, 0, 0]);
GameData.Parts.Shoes.push(["Luize", 71, 0, 0, 0]);
GameData.Parts.Shoes.push(["Utsuho", 72, 0, 0, 0]);
GameData.Parts.Shoes.push(["Orin", 73, 0, 0, 0]);
GameData.Parts.Shoes.push(["Satori", 74, 0, 0, 0]);
GameData.Parts.Shoes.push(["Koishi", 75, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yumeko", 76, 0, 0, 0]);
GameData.Parts.Shoes.push(["Ruukoto", 77, 0, 0, 0]);
GameData.Parts.Shoes.push(["Mugetsu", 78, 0, 0, 0]);
GameData.Parts.Shoes.push(["VIVIT", 79, 0, 0, 0]);
GameData.Parts.Shoes.push(["Gengetsu", 80, 0, 0, 0]);
GameData.Parts.Shoes.push(["Sariel", 81, 0, 0, 0]);
GameData.Parts.Shoes.push(["Konngara", 82, 0, 0, 0]);
GameData.Parts.Shoes.push(["Kotohime", 83, 0, 0, 0]);
GameData.Parts.Shoes.push(["Orange", 84, 0, 0, 0]);
GameData.Parts.Shoes.push(["Rikako", 85, 0, 0, 0]);
GameData.Parts.Shoes.push(["Rika", 86, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yuki", 87, 0, 0, 0]);
GameData.Parts.Shoes.push(["Mai", 88, 0, 0, 0]);
GameData.Parts.Shoes.push(["Ellen", 89, 0, 0, 0]);
GameData.Parts.Shoes.push(["Kana", 90, 0, 0, 0]);
GameData.Parts.Shoes.push(["Elly", 91, 0, 0, 0]);
GameData.Parts.Shoes.push(["Sara", 92, 0, 0, 0]);
GameData.Parts.Shoes.push(["Meira", 93, 0, 0, 0]);
GameData.Parts.Shoes.push(["Elis", 94, 0, 0, 0]);
GameData.Parts.Shoes.push(["Shingyoku F", 95, 0, 0, 0]);
GameData.Parts.Shoes.push(["Shingyoku M", 96, 0, 0, 0]);
GameData.Parts.Shoes.push(["Yuka (PJ's)", 97, 0, 0, 0]);
GameData.Parts.Shoes.push(["Ghost", 98, 0, 0, 0]);
GameData.Parts.Shoes.push(["Marisa (SA)", 99, 0, 0, 0]);
GameData.Parts.Shoes.push(["Reisen (SWR)", 100, 0, 0, 0]);
GameData.Parts.Shoes.push(["Nazrin", 101, 0, 0, 0]);
GameData.Parts.Shoes.push(["Kogasa", 102, 0, 0, 0]);
GameData.Parts.Shoes.push(["Ichirin", 103, 0, 0, 0]);
GameData.Parts.Shoes.push(["Marisa", 104, 0, 0, 0]);
GameData.Parts.Shoes.push(["Zombie Fairy", 105, 0, 0, 0]);
GameData.Parts.Shoes.push(["Shanghai", 106, 0, 0, 0]);
GameData.Parts.Shoes.push(["Rin Satsuki", 107, 0, 0, 0]);
GameData.Parts.Shoes.push(["Layla", 108, 0, 0, 0]);
GameData.Parts.Shoes.push(["Meimu", 109, 0, 0, 0]);
GameData.Parts.Shoes.push(["Stick Legs", 110, 0, 0, 0]);
GameData.Parts.Shoes.push(["Sakuya (Magical)", 111, 0, 0, 0]);
GameData.Parts.Shoes.push(["Spider", 112, 0, 0, 0]);
GameData.Parts.Shoes.push(["Snake", 113, 0, 0, 0]);
GameData.Parts.Shoes.push(["Fish", 114, 0, 0, 0]);
GameData.Parts.Shoes.push(["Utsuho 2", 115, 0, 0, 0]);
GameData.Parts.Shoes.push(["Utsuho 2 Alt", 116, 0, 0, 0]);
GameData.Parts.Shoes.push(["Tojiko", 117, 0, 0, 0]);
GameData.Parts.Shoes.push(["Futo", 118, 0, 0, 0]);
GameData.Parts.Shoes.push("random");
GameData.Parts.Arms = new Array();
GameData.Parts.Arms.push("none");
GameData.Parts.Arms.push(["Meiling", 1, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu", 2, 0, 0, 0]);
GameData.Parts.Arms.push(["Marisa", 3, 0, 0, 0]);
GameData.Parts.Arms.push(["Sakuya", 4, 0, 0, 0]);
GameData.Parts.Arms.push(["Yukari", 5, 0, 0, 0]);
GameData.Parts.Arms.push(["Flandre", 6, 0, 0, 0]);
GameData.Parts.Arms.push(["Yuyuko", 7, 0, 0, 0]);
GameData.Parts.Arms.push(["Kaguya", 8, 0, 0, 0]);
GameData.Parts.Arms.push(["Cirno", 9, 0, 0, 0]);
GameData.Parts.Arms.push(["Eirin", 10, 0, 0, 0]);
GameData.Parts.Arms.push(["Youmu", 11, 0, 0, 0]);
GameData.Parts.Arms.push(["Patchouli", 12, 0, 0, 0]);
GameData.Parts.Arms.push(["Alice", 13, 0, 0, 0]);
GameData.Parts.Arms.push(["Reisen", 14, 0, 0, 0]);
GameData.Parts.Arms.push(["Mokou", 15, 0, 0, 0]);
GameData.Parts.Arms.push(["Mystia", 16, 0, 0, 0]);
GameData.Parts.Arms.push(["Tewi", 17, 0, 0, 0]);
GameData.Parts.Arms.push(["Keine", 18, 0, 0, 0]);
GameData.Parts.Arms.push(["Ran", 19, 0, 0, 0]);
GameData.Parts.Arms.push(["Letty", 20, 0, 0, 0]);
GameData.Parts.Arms.push(["Chen", 21, 0, 0, 0]);
GameData.Parts.Arms.push(["Suika", 22, 0, 0, 0]);
GameData.Parts.Arms.push(["Remilia", 23, 0, 0, 0]);
GameData.Parts.Arms.push(["Lily White", 24, 0, 0, 0]);
GameData.Parts.Arms.push(["Lily Black", 25, 0, 0, 0]);
GameData.Parts.Arms.push(["Komachi", 26, 0, 0, 0]);
GameData.Parts.Arms.push(["Nitori", 27, 0, 0, 0]);
GameData.Parts.Arms.push(["Sikieiki", 28, 0, 0, 0]);
GameData.Parts.Arms.push(["Wriggle", 29, 0, 0, 0]);
GameData.Parts.Arms.push(["Rumia", 30, 0, 0, 0]);
GameData.Parts.Arms.push(["Aya", 31, 0, 0, 0]);
GameData.Parts.Arms.push(["Momizi", 32, 0, 0, 0]);
GameData.Parts.Arms.push(["Koakuma", 33, 0, 0, 0]);
GameData.Parts.Arms.push(["Lunasa", 34, 0, 0, 0]);
GameData.Parts.Arms.push(["Merlin", 35, 0, 0, 0]);
GameData.Parts.Arms.push(["Lyrica", 36, 0, 0, 0]);
GameData.Parts.Arms.push(["Daiyousei", 37, 0, 0, 0]);
GameData.Parts.Arms.push(["Medicine", 38, 0, 0, 0]);
GameData.Parts.Arms.push(["Keine (EX)", 39, 0, 0, 0]);
GameData.Parts.Arms.push(["Yuka", 40, 0, 0, 0]);
GameData.Parts.Arms.push(["Suwako", 41, 0, 0, 0]);
GameData.Parts.Arms.push(["Hina", 42, 0, 0, 0]);
GameData.Parts.Arms.push(["Sanae", 43, 0, 0, 0]);
GameData.Parts.Arms.push(["Kanako", 44, 0, 0, 0]);
GameData.Parts.Arms.push(["Minoriko", 45, 0, 0, 0]);
GameData.Parts.Arms.push(["Shizuha", 46, 0, 0, 0]);
GameData.Parts.Arms.push(["Shinki", 47, 0, 0, 0]);
GameData.Parts.Arms.push(["Mima", 48, 0, 0, 0]);
GameData.Parts.Arms.push(["Rinnosuke", 49, 0, 0, 0]);
GameData.Parts.Arms.push(["Tokiko", 50, 0, 0, 0]);
GameData.Parts.Arms.push(["Sunny Milk", 51, 0, 0, 0]);
GameData.Parts.Arms.push(["Star Sapphire", 52, 0, 0, 0]);
GameData.Parts.Arms.push(["Luna Child", 53, 0, 0, 0]);
GameData.Parts.Arms.push(["Akyu", 54, 0, 0, 0]);
GameData.Parts.Arms.push(["Renko", 55, 0, 0, 0]);
GameData.Parts.Arms.push(["Maribel", 56, 0, 0, 0]);
GameData.Parts.Arms.push(["Chiyuri", 57, 0, 0, 0]);
GameData.Parts.Arms.push(["Yumemi", 58, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu (PC-98)", 59, 0, 0, 0]);
GameData.Parts.Arms.push(["Yamame", 60, 0, 0, 0]);
GameData.Parts.Arms.push(["Tenshi", 61, 0, 0, 0]);
GameData.Parts.Arms.push(["Iku", 62, 0, 0, 0]);
GameData.Parts.Arms.push(["Yuugi", 63, 0, 0, 0]);
GameData.Parts.Arms.push(["Parsee", 64, 0, 0, 0]);
GameData.Parts.Arms.push(["Yorihime", 65, 0, 0, 0]);
GameData.Parts.Arms.push(["Toyohime", 66, 0, 0, 0]);
GameData.Parts.Arms.push(["Marisa (PC-98)", 67, 0, 0, 0]);
GameData.Parts.Arms.push(["Youki", 68, 0, 0, 0]);
GameData.Parts.Arms.push(["Alice (PC-98)", 69, 0, 0, 0]);
GameData.Parts.Arms.push(["Kurumi", 70, 0, 0, 0]);
GameData.Parts.Arms.push(["Luize", 71, 0, 0, 0]);
GameData.Parts.Arms.push(["Utsuho", 72, 0, 0, 0]);
GameData.Parts.Arms.push(["Orin", 73, 0, 0, 0]);
GameData.Parts.Arms.push(["Satori", 74, 0, 0, 0]);
GameData.Parts.Arms.push(["Koishi", 75, 0, 0, 0]);
GameData.Parts.Arms.push(["Yumeko", 76, 0, 0, 0]);
GameData.Parts.Arms.push(["Ruukoto", 77, 0, 0, 0]);
GameData.Parts.Arms.push(["Mugetsu", 78, 0, 0, 0]);
GameData.Parts.Arms.push(["VIVIT", 79, 0, 0, 0]);
GameData.Parts.Arms.push(["Gengetsu", 80, 0, 0, 0]);
GameData.Parts.Arms.push(["Sariel", 81, 0, 0, 0]);
GameData.Parts.Arms.push(["Konngara", 82, 0, 0, 0]);
GameData.Parts.Arms.push(["Kotohime", 83, 0, 0, 0]);
GameData.Parts.Arms.push(["Orange", 84, 0, 0, 0]);
GameData.Parts.Arms.push(["Rikako", 85, 0, 0, 0]);
GameData.Parts.Arms.push(["Rika", 86, 0, 0, 0]);
GameData.Parts.Arms.push(["Yuki", 87, 0, 0, 0]);
GameData.Parts.Arms.push(["Mai", 88, 0, 0, 0]);
GameData.Parts.Arms.push(["Ellen", 89, 0, 0, 0]);
GameData.Parts.Arms.push(["Kana", 90, 0, 0, 0]);
GameData.Parts.Arms.push(["Elly", 91, 0, 0, 0]);
GameData.Parts.Arms.push(["Sara", 92, 0, 0, 0]);
GameData.Parts.Arms.push(["Meira", 93, 0, 0, 0]);
GameData.Parts.Arms.push(["Elis", 94, 0, 0, 0]);
GameData.Parts.Arms.push(["Shingyoku F", 95, 0, 0, 0]);
GameData.Parts.Arms.push(["Shingyoku M", 96, 0, 0, 0]);
GameData.Parts.Arms.push(["Yuka (PJ's)", 97, 0, 0, 0]);
GameData.Parts.Arms.push(["Yukari (PCB)", 98, 0, 0, 0]);
GameData.Parts.Arms.push(["Marisa (SA)", 99, 0, 0, 0]);
GameData.Parts.Arms.push(["Reisen (SWR)", 100, 0, 0, 0]);
GameData.Parts.Arms.push(["Nazrin", 101, 0, 0, 0]);
GameData.Parts.Arms.push(["Kogasa", 102, 0, 0, 0]);
GameData.Parts.Arms.push(["Ichirin", 103, 0, 0, 0]);
GameData.Parts.Arms.push(["Marisa (UFO)", 104, 0, 0, 0]);
GameData.Parts.Arms.push(["Zombie Fairy", 105, 0, 0, 0]);
GameData.Parts.Arms.push(["Shanghai", 106, 0, 0, 0]);
GameData.Parts.Arms.push(["Rin Satsuki", 107, 0, 0, 0]);
GameData.Parts.Arms.push(["Layla", 108, 0, 0, 0]);
GameData.Parts.Arms.push(["Meimu", 109, 0, 0, 0]);
GameData.Parts.Arms.push(["Stick Arms", 110, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu (2)", 111, 0, 0, 0]);
GameData.Parts.Arms.push(["Yukari (IaMP)", 112, 0, 0, 0]);
GameData.Parts.Arms.push(["Flandre (2)", 113, 0, 0, 0]);
GameData.Parts.Arms.push(["Yuyuko (2)", 114, 0, 0, 0]);
GameData.Parts.Arms.push(["Kaguya (2)", 115, 0, 0, 0]);
GameData.Parts.Arms.push(["Eirin (2)", 116, 0, 0, 0]);
GameData.Parts.Arms.push(["Youmu (2)", 117, 0, 0, 0]);
GameData.Parts.Arms.push(["Patchouli (2)", 118, 0, 0, 0]);
GameData.Parts.Arms.push(["Alice (2)", 119, 0, 0, 0]);
GameData.Parts.Arms.push(["Reisen (2)", 120, 0, 0, 0]);
GameData.Parts.Arms.push(["Mokou (2)", 121, 0, 0, 0]);
GameData.Parts.Arms.push(["Mystia (2A)", 122, 0, 0, 0]);
GameData.Parts.Arms.push(["Mystia (2B)", 123, 0, 0, 0]);
GameData.Parts.Arms.push(["Tewi (2)", 124, 0, 0, 0]);
GameData.Parts.Arms.push(["Ran (2)", 125, 0, 0, 0]);
GameData.Parts.Arms.push(["Letty (2)", 126, 0, 0, 0]);
GameData.Parts.Arms.push(["Chen (2)", 127, 0, 0, 0]);
GameData.Parts.Arms.push(["Suika (2)", 128, 0, 0, 0]);
GameData.Parts.Arms.push(["Murasa", 129, 0, 0, 0]);
GameData.Parts.Arms.push(["Shou", 130, 0, 0, 0]);
GameData.Parts.Arms.push(["Byakuren ", 131, 0, 0, 0]);
GameData.Parts.Arms.push(["Byakuren (Alt)", 132, 0, 0, 0]);
GameData.Parts.Arms.push(["Byakuren (Alt2)", 133, 0, 0, 0]);
GameData.Parts.Arms.push(["Raised Arm", 134, 0, 0, 0]);
GameData.Parts.Arms.push(["Nue", 135, 0, 0, 0]);
GameData.Parts.Arms.push(["Remilia (2)", 136, 0, 0, 0]);
GameData.Parts.Arms.push(["Lily White (2)", 137, 0, 0, 0]);
GameData.Parts.Arms.push(["Lily Black (2)", 138, 0, 0, 0]);
GameData.Parts.Arms.push(["Komachi (2)", 139, 0, 0, 0]);
GameData.Parts.Arms.push(["Nitori (2)", 140, 0, 0, 0]);
GameData.Parts.Arms.push(["Sikieiki (2)", 141, 0, 0, 0]);
GameData.Parts.Arms.push(["Wriggle (2)", 142, 0, 0, 0]);
GameData.Parts.Arms.push(["Rumia (2)", 143, 0, 0, 0]);
GameData.Parts.Arms.push(["Outstretched SS", 144, 0, 0, 0]);
GameData.Parts.Arms.push(["Aya (2)", 145, 0, 0, 0]);
GameData.Parts.Arms.push(["Momizi (2)", 146, 0, 0, 0]);
GameData.Parts.Arms.push(["Koakuma (2)", 147, 0, 0, 0]);
GameData.Parts.Arms.push(["Lunasa (2)", 148, 0, 0, 0]);
GameData.Parts.Arms.push(["Merlin (2)", 149, 0, 0, 0]);
GameData.Parts.Arms.push(["Lyrica (2)", 150, 0, 0, 0]);
GameData.Parts.Arms.push(["Sakuya (Magical)", 151, 0, 0, 0]);
GameData.Parts.Arms.push(["Daiyousei (2)", 152, 0, 0, 0]);
GameData.Parts.Arms.push(["Medicine (2)", 153, 0, 0, 0]);
GameData.Parts.Arms.push(["Santa", 154, 0, 0, 0]);
GameData.Parts.Arms.push(["Suwako (2)", 155, 0, 0, 0]);
GameData.Parts.Arms.push(["Hina (2)", 156, 0, 0, 0]);
GameData.Parts.Arms.push(["Sanae (2)", 157, 0, 0, 0]);
GameData.Parts.Arms.push(["Kanako (2)", 158, 0, 0, 0]);
GameData.Parts.Arms.push(["Minoriko (2)", 159, 0, 0, 0]);
GameData.Parts.Arms.push(["Shizuha (2)", 160, 0, 0, 0]);
GameData.Parts.Arms.push(["Shinki (2)", 161, 0, 0, 0]);
GameData.Parts.Arms.push(["Utsuho (Alt)", 162, 0, 0, 0]);
GameData.Parts.Arms.push(["Mima (2)", 163, 0, 0, 0]);
GameData.Parts.Arms.push(["Rinnosuke (2)", 164, 0, 0, 0]);
GameData.Parts.Arms.push(["Rengeteki", 165, 0, 0, 0]);
GameData.Parts.Arms.push(["Rengeteki (Alt)", 166, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu (P2)", 167, 0, 0, 0]);
GameData.Parts.Arms.push(["Blue Uniform", 168, 0, 0, 0]);
GameData.Parts.Arms.push(["Tokiko (2)", 169, 0, 0, 0]);
GameData.Parts.Arms.push(["Red Trenchcoat", 170, 0, 0, 0]);
GameData.Parts.Arms.push(["Black Coat", 171, 0, 0, 0]);
GameData.Parts.Arms.push(["Sunny Milk (2)", 172, 0, 0, 0]);
GameData.Parts.Arms.push(["Star Sapphire (2)", 173, 0, 0, 0]);
GameData.Parts.Arms.push(["Hatate", 174, 0, 0, 0]);
GameData.Parts.Arms.push(["Luna Child (2)", 175, 0, 0, 0]);
GameData.Parts.Arms.push(["Akyu (2)", 176, 0, 0, 0]);
GameData.Parts.Arms.push(["Brown Trenchcoat", 177, 0, 0, 0]);
GameData.Parts.Arms.push(["Maribel (2)", 178, 0, 0, 0]);
GameData.Parts.Arms.push(["Teacher", 179, 0, 0, 0]);
GameData.Parts.Arms.push(["Yamame (2A)", 180, 0, 0, 0]);
GameData.Parts.Arms.push(["Wooden Gauntlets", 181, 0, 0, 0]);
GameData.Parts.Arms.push(["Yamame (2B)", 182, 0, 0, 0]);
GameData.Parts.Arms.push(["Chiyuri (2)", 183, 0, 0, 0]);
GameData.Parts.Arms.push(["Yumemi (2)", 184, 0, 0, 0]);
GameData.Parts.Arms.push(["Purple Trenchcoat", 185, 0, 0, 0]);
GameData.Parts.Arms.push(["Blue Uniform 2", 186, 0, 0, 0]);
GameData.Parts.Arms.push(["Pink Sleeves", 187, 0, 0, 0]);
GameData.Parts.Arms.push(["Camo (Green)", 188, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu (PC-98 2)", 189, 0, 0, 0]);
GameData.Parts.Arms.push(["Kimono (Indigo)", 190, 0, 0, 0]);
GameData.Parts.Arms.push(["Camo (Grey)", 191, 0, 0, 0]);
GameData.Parts.Arms.push(["Tenshi (2)", 192, 0, 0, 0]);
GameData.Parts.Arms.push(["Alice (in W)", 193, 0, 0, 0]);
GameData.Parts.Arms.push(["Mystia (Black)", 194, 0, 0, 0]);
GameData.Parts.Arms.push(["Iku (2)", 195, 0, 0, 0]);
GameData.Parts.Arms.push(["Green Trenchcoat", 196, 0, 0, 0]);
GameData.Parts.Arms.push(["Yuugi (2)", 197, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu (2 Alt)", 198, 0, 0, 0]);
GameData.Parts.Arms.push(["Red+Blue", 199, 0, 0, 0]);
GameData.Parts.Arms.push(["Parsee (2)", 200, 0, 0, 0]);
GameData.Parts.Arms.push(["Utsuho (2A)", 201, 0, 0, 0]);
GameData.Parts.Arms.push(["Utsuho (2B)", 202, 0, 0, 0]);
GameData.Parts.Arms.push(["Orin (2A)", 203, 0, 0, 0]);
GameData.Parts.Arms.push(["Orin (2B)", 204, 0, 0, 0]);
GameData.Parts.Arms.push(["Sleeveless Outstreched", 205, 0, 0, 0]);
GameData.Parts.Arms.push(["Long Outstreched", 206, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu Outstreched", 207, 0, 0, 0]);
GameData.Parts.Arms.push(["Short Blue", 208, 0, 0, 0]);
GameData.Parts.Arms.push(["Utsuho (2C)", 209, 0, 0, 0]);
GameData.Parts.Arms.push(["Satori (2)", 210, 0, 0, 0]);
GameData.Parts.Arms.push(["Short Black Sleeves", 211, 0, 0, 0]);
GameData.Parts.Arms.push(["Suika (2 Alt)", 212, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu (PC-98 2 Green)", 213, 0, 0, 0]);
GameData.Parts.Arms.push(["Koishi (2)", 214, 0, 0, 0]);
GameData.Parts.Arms.push(["Kasen", 215, 0, 0, 0]);
GameData.Parts.Arms.push(["Kasen (Alt)", 216, 0, 0, 0]);
GameData.Parts.Arms.push(["Pink Trenchcoat", 217, 0, 0, 0]);
GameData.Parts.Arms.push(["Mitori", 218, 0, 0, 0]);
GameData.Parts.Arms.push(["Kasen (Alt 2)", 219, 0, 0, 0]);
GameData.Parts.Arms.push(["Kasen (Alt 3)", 220, 0, 0, 0]);
GameData.Parts.Arms.push(["Kasen (Alt 4)", 221, 0, 0, 0]);
GameData.Parts.Arms.push(["Sasha", 222, 0, 0, 0]);
GameData.Parts.Arms.push(["Dark Green", 223, 0, 0, 0]);
GameData.Parts.Arms.push(["Yorihime 2A", 224, 0, 0, 0]);
GameData.Parts.Arms.push(["Yorihime 2B", 225, 0, 0, 0]);
GameData.Parts.Arms.push(["Toyohime 2", 226, 0, 0, 0]);
GameData.Parts.Arms.push(["Youki 2", 227, 0, 0, 0]);
GameData.Parts.Arms.push(["Alice (PC-98) 2", 228, 0, 0, 0]);
GameData.Parts.Arms.push(["Kurumi 2", 229, 0, 0, 0]);
GameData.Parts.Arms.push(["Marisa (PC-98) 2", 230, 0, 0, 0]);
GameData.Parts.Arms.push(["Luize 2", 231, 0, 0, 0]);
GameData.Parts.Arms.push(["Yumeko 2", 232, 0, 0, 0]);
GameData.Parts.Arms.push(["Ruukoto 2", 233, 0, 0, 0]);
GameData.Parts.Arms.push(["Mugetsu 2", 234, 0, 0, 0]);
GameData.Parts.Arms.push(["Gengetsu 2", 235, 0, 0, 0]);
GameData.Parts.Arms.push(["Sariel 2", 236, 0, 0, 0]);
GameData.Parts.Arms.push(["Kotohime 2", 237, 0, 0, 0]);
GameData.Parts.Arms.push(["Orange 2", 238, 0, 0, 0]);
GameData.Parts.Arms.push(["Rikako 2", 239, 0, 0, 0]);
GameData.Parts.Arms.push(["Yuki 2", 240, 0, 0, 0]);
GameData.Parts.Arms.push(["VIVIT 2", 241, 0, 0, 0]);
GameData.Parts.Arms.push(["Mai 2", 242, 0, 0, 0]);
GameData.Parts.Arms.push(["Kana 2", 243, 0, 0, 0]);
GameData.Parts.Arms.push(["Kimono (Gold)", 244, 0, 0, 0]);
GameData.Parts.Arms.push(["Elly 2", 245, 0, 0, 0]);
GameData.Parts.Arms.push(["Sara 2", 246, 0, 0, 0]);
GameData.Parts.Arms.push(["Meira 2", 247, 0, 0, 0]);
GameData.Parts.Arms.push(["Elis 2", 248, 0, 0, 0]);
GameData.Parts.Arms.push(["Shingyoku M 2", 249, 0, 0, 0]);
GameData.Parts.Arms.push(["Yuka (PJ's 2)", 250, 0, 0, 0]);
GameData.Parts.Arms.push(["Yukari (PCB 2)", 251, 0, 0, 0]);
GameData.Parts.Arms.push(["Kimono (Purple)", 252, 0, 0, 0]);
GameData.Parts.Arms.push(["Kimono (Maroon)", 253, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu (White)", 254, 0, 0, 0]);
GameData.Parts.Arms.push(["Ichirin 2", 255, 0, 0, 0]);
GameData.Parts.Arms.push(["Shanghai 2", 256, 0, 0, 0]);
GameData.Parts.Arms.push(["Reimu (Green)", 257, 0, 0, 0]);
GameData.Parts.Arms.push(["Kyouko", 258, 0, 0, 0]);
GameData.Parts.Arms.push(["Yoshika", 259, 0, 0, 0]);
GameData.Parts.Arms.push(["Seiga", 260, 0, 0, 0]);
GameData.Parts.Arms.push(["Tojiko", 261, 0, 0, 0]);
GameData.Parts.Arms.push(["Futo", 262, 0, 0, 0]);
GameData.Parts.Arms.push(["Miko", 263, 0, 0, 0]);
GameData.Parts.Arms.push(["Mamizou", 264, 0, 0, 0]);
GameData.Parts.Arms.push("random");
GameData.Parts.Hair = new Array();
GameData.Parts.Hair.push(["Meiling", 1, 0, 0, 0, 2, "EB585A"]);
GameData.Parts.Hair.push(["Reimu", 2, 0, 0, 0, 0, "283960"]);
GameData.Parts.Hair.push(["Marisa", 3, 0, 0, 0, 0, "FFFF6F"]);
GameData.Parts.Hair.push(["Sakuya", 4, 0, 0, 0, 0, "E6E6E6"]);
GameData.Parts.Hair.push(["Yukari", 5, 0, 0, 0, 0, "FFFF80"]);
GameData.Parts.Hair.push(["Flandre", 6, 0, 0, 0, 0, "FFFF80"]);
GameData.Parts.Hair.push(["Yuyuko", 7, 0, 0, 0, 0, "FF9999"]);
GameData.Parts.Hair.push(["Kaguya", 8, 0, 0, 0, 0, "444444"]);
GameData.Parts.Hair.push(["Cirno", 9, 0, 0, 0, 0, "49CAE9"]);
GameData.Parts.Hair.push(["Eirin", 10, 0, 0, 0, 0, "F2F2F2"]);
GameData.Parts.Hair.push(["Youmu", 11, 0, 0, 0, 0, "F2F2F2"]);
GameData.Parts.Hair.push(["Patchouli", 12, 0, 0, 0, 0, "AB80BF"]);
GameData.Parts.Hair.push(["Alice", 13, 0, 0, 0, 0, "FFFF80"]);
GameData.Parts.Hair.push(["Reisen", 14, 0, 0, 0, 0, "E788FF"]);
GameData.Parts.Hair.push(["Mokou", 15, 0, 0, 0, 0, "EEEEEE"]);
GameData.Parts.Hair.push(["Mystia", 16, 0, 0, 0, 0, "F19FAD"]);
GameData.Parts.Hair.push(["Tewi", 17, 0, 0, 0, 0, "333333"]);
GameData.Parts.Hair.push(["Keine", 18, 0, 0, 0, 0, "D2D2DC"]);
GameData.Parts.Hair.push(["Ran", 19, 0, 0, 0, 0, "FEE170"]);
GameData.Parts.Hair.push(["Letty", 20, 0, 0, 0, 0, "E1D5FF"]);
GameData.Parts.Hair.push(["Chen", 21, 0, 0, 0, 0, "994D00"]);
GameData.Parts.Hair.push(["Suika", 22, 0, 0, 0, 0, "FEB74E"]);
GameData.Parts.Hair.push(["Remilia", 23, 0, 0, 0, 0, "80A2D5"]);
GameData.Parts.Hair.push(["Lily White", 24, 0, 0, 0, 0, "FEFDA3"]);
GameData.Parts.Hair.push(["Lily Black", 25, 0, 0, 0, 0, "F3BB69"]);
GameData.Parts.Hair.push(["Komachi", 26, 0, 0, 0, 0, "CB4545"]);
GameData.Parts.Hair.push(["Nitori", 27, 0, 0, 0, 0, "4B95F6"]);
GameData.Parts.Hair.push(["Sikieiki", 28, 0, 0, 0, 0, "BBD5C5"]);
GameData.Parts.Hair.push(["Wriggle", 29, 0, 0, 0, 0, "497255"]);
GameData.Parts.Hair.push(["Rumia", 30, 0, 0, 0, 0, "FEF39A"]);
GameData.Parts.Hair.push(["Aya", 31, 0, 0, 0, 0, "332B1A"]);
GameData.Parts.Hair.push(["Momizi", 32, 0, 0, 0, 0, "FBFBFB"]);
GameData.Parts.Hair.push(["Koakuma", 33, 0, 0, 0, 0, "9C1F1F"]);
GameData.Parts.Hair.push(["Lunasa", 34, 0, 0, 0, 0, "FEF4A3"]);
GameData.Parts.Hair.push(["Merlin", 35, 0, 0, 0, 0, "DDF2FF"]);
GameData.Parts.Hair.push(["Lyrica", 36, 0, 0, 0, 0, "A3827E"]);
GameData.Parts.Hair.push(["Daiyousei", 37, 0, 0, 0, 0, "A4F4B4"]);
GameData.Parts.Hair.push(["Medicine", 38, 0, 0, 0, 0, "FFF9A4"]);
GameData.Parts.Hair.push(["Keine (EX)", 39, 0, 0, 0, 0, "D2D2DC"]);
GameData.Parts.Hair.push(["Yuka", 40, 0, 0, 0, 0, "309C30"]);
GameData.Parts.Hair.push(["Suwako", 41, 0, 0, 0, 0, "FAFFC4"]);
GameData.Parts.Hair.push(["Hina", 42, 0, 0, 0, 1, "87E791"]);
GameData.Parts.Hair.push(["Sanae", 43, 0, 0, 0, 0, "98F898"]);
GameData.Parts.Hair.push(["Kanako", 44, 0, 0, 0, 0, "6767E4"]);
GameData.Parts.Hair.push(["Minoriko", 45, 0, 0, 0, 0, "FFCC57"]);
GameData.Parts.Hair.push(["Shizuha", 46, 0, 0, 0, 0, "FFF06F"]);
GameData.Parts.Hair.push(["Shinki", 47, 0, 0, 0, 0, "EDEAFB"]);
GameData.Parts.Hair.push(["Mima", 48, 0, 0, 0, 0, "48771A"]);
GameData.Parts.Hair.push(["Rinnosuke", 49, 0, 0, 0, 0, "FBFBFB"]);
GameData.Parts.Hair.push(["Tokiko", 50, 0, 0, 0, 0, "EEEEEE"]);
GameData.Parts.Hair.push(["Sunny Milk", 51, 0, 0, 0, 0, "F7ED8C"]);
GameData.Parts.Hair.push(["Star Sapphire", 52, 0, 0, 0, 0, "444444"]);
GameData.Parts.Hair.push(["Luna Child", 53, 0, 0, 0, 0, "ECEB57"]);
GameData.Parts.Hair.push(["Akyu", 54, 0, 0, 0, 0, "C073C0"]);
GameData.Parts.Hair.push(["Renko", 55, 0, 0, 0, 0, "947252"]);
GameData.Parts.Hair.push(["Maribel", 56, 0, 0, 0, 0, "FFF177"]);
GameData.Parts.Hair.push(["Chiyuri", 57, 0, 0, 0, 0, "FEF4AB"]);
GameData.Parts.Hair.push(["Yumemi", 58, 0, 0, 0, 0, "934242"]);
GameData.Parts.Hair.push(["Reimu (PC-98)", 59, 0, 0, 0, 0, "890099"]);
GameData.Parts.Hair.push(["Yamame", 60, 0, 0, 0, 0, "FEF1C4"]);
GameData.Parts.Hair.push(["Tenshi", 61, 0, 0, 0, 0, "2987C5"]);
GameData.Parts.Hair.push(["Iku", 62, 0, 0, 0, 0, "8C75EA"]);
GameData.Parts.Hair.push(["Yuugi", 63, 0, 0, 0, 0, "EFDDAF"]);
GameData.Parts.Hair.push(["Kisume", 64, 0, 0, 0, 0, "20AD79"]);
GameData.Parts.Hair.push(["Parsee", 65, 0, 0, 0, 0, "F9E586"]);
GameData.Parts.Hair.push(["Yorihime", 66, 0, 0, 0, 0, "D6CBDE"]);
GameData.Parts.Hair.push(["Toyohime", 67, 0, 0, 0, 0, "FEEDB9"]);
GameData.Parts.Hair.push(["Marisa (PC-98)", 68, 0, 0, 0, 0, "FEFE54"]);
GameData.Parts.Hair.push(["Youki", 69, 0, 0, 0, 0, "F7F7F7"]);
GameData.Parts.Hair.push(["Alice (PC-98)", 70, 0, 0, 0, 0, "FEFE54"]);
GameData.Parts.Hair.push(["Kurumi", 71, 0, 0, 0, 0, "FFFF77"]);
GameData.Parts.Hair.push(["Luize", 72, 0, 0, 0, 0, "FEFDAB"]);
GameData.Parts.Hair.push(["Utsuho", 73, 0, 0, 0, 0, "3C3C3C"]);
GameData.Parts.Hair.push(["Orin", 74, 0, 0, 0, 0, "D76464"]);
GameData.Parts.Hair.push(["Satori", 75, 0, 0, 0, 0, "E3BBFF"]);
GameData.Parts.Hair.push(["Koishi", 76, 0, 0, 0, 0, "DDFFE7"]);
GameData.Parts.Hair.push(["Yumeko", 77, 0, 0, 0, 0, "FEFE70"]);
GameData.Parts.Hair.push(["Ruukoto", 78, 0, 0, 0, 0, "70FE70"]);
GameData.Parts.Hair.push(["Mugetsu", 79, 0, 0, 0, 0, "FEFD89"]);
GameData.Parts.Hair.push(["VIVIT", 80, 0, 0, 0, 0, "ED5F5F"]);
GameData.Parts.Hair.push(["Gengetsu", 81, 0, 0, 0, 0, "FFFF5E"]);
GameData.Parts.Hair.push(["Sariel", 82, 0, 0, 0, 0, "DDDDFF"]);
GameData.Parts.Hair.push(["Konngara", 83, 0, 0, 0, 0, "3C3C3C"]);
GameData.Parts.Hair.push(["Kotohime", 84, 0, 0, 0, 3, "BF0000"]);
GameData.Parts.Hair.push(["Orange", 85, 0, 0, 0, 0, "EB585A"]);
GameData.Parts.Hair.push(["Rikako", 86, 0, 0, 0, 0, "980198"]);
GameData.Parts.Hair.push(["Rika", 87, 0, 0, 0, 0, "7A380E"]);
GameData.Parts.Hair.push(["Yuki", 88, 0, 0, 0, 0, "FEFE54"]);
GameData.Parts.Hair.push(["Mai", 89, 0, 0, 0, 0, "ABABFE"]);
GameData.Parts.Hair.push(["Ellen", 90, 0, 0, 0, 0, "FEFD92"]);
GameData.Parts.Hair.push(["Kana", 91, 0, 0, 0, 0, "FFFFA2"]);
GameData.Parts.Hair.push(["Elly", 92, 0, 0, 0, 0, "FFFF88"]);
GameData.Parts.Hair.push(["Sara", 93, 0, 0, 0, 0, "EFABBA"]);
GameData.Parts.Hair.push(["Meira", 94, 0, 0, 0, 0, "B835B9"]);
GameData.Parts.Hair.push(["Elis", 95, 0, 0, 0, 0, "EEED09"]);
GameData.Parts.Hair.push(["Shingyoku F", 96, 0, 0, 0, 0, "D22D2D"]);
GameData.Parts.Hair.push(["Shingyoku M", 97, 0, 0, 0, 0, "393939"]);
GameData.Parts.Hair.push(["Yuka (PJ's)", 98, 0, 0, 0, 0, "23AB23"]);
GameData.Parts.Hair.push(["Yukari (PCB)", 99, 0, 0, 0, 0, "FFFF80"]);
GameData.Parts.Hair.push(["Marisa (SA)", 100, 0, 0, 0, 0, "F5E981"]);
GameData.Parts.Hair.push(["Reisen II", 101, 0, 0, 0, 0, "BFB4D3"]);
GameData.Parts.Hair.push(["Nazrin", 102, 0, 0, 0, 0, "969696"]);
GameData.Parts.Hair.push(["Kogasa", 103, 0, 0, 0, 0, "6AA8AE"]);
GameData.Parts.Hair.push(["Ichirin", 104, 0, 0, 0, 0, "B8BCE0"]);
GameData.Parts.Hair.push(["Marisa (UFO)", 105, 0, 0, 0, 0, "FFF600"]);
GameData.Parts.Hair.push(["Zombie Fairy", 106, 0, 0, 0, 0, "D9DDFF"]);
GameData.Parts.Hair.push(["Shanghai", 107, 0, 0, 0, 0, "FFFF80"]);
GameData.Parts.Hair.push(["Rin Satsuki", 108, 0, 0, 0, 0, "F5FABA"]);
GameData.Parts.Hair.push(["Layla", 109, 0, 0, 0, 0, "51B087"]);
GameData.Parts.Hair.push(["Meimu", 110, 0, 0, 0, 4, "DAC2F6"]);
GameData.Parts.Hair.push(["Meiling (2)", 111, 0, 0, 0, 5, "EB585A"]);
GameData.Parts.Hair.push(["Lie Meiling", 111, 0, 0, 0, 5, "373737"]);
GameData.Parts.Hair.push(["Reimu (2 Blue)", 112, 0, 0, 0, 0, "283960"]);
GameData.Parts.Hair.push(["Marisa (PCB)", 113, 0, 0, 0, 0, "FEFD92"]);
GameData.Parts.Hair.push(["Sakuya (2)", 114, 0, 0, 0, 6, "E6E6E6"]);
GameData.Parts.Hair.push(["Yukari (IaMP)", 115, 0, 0, 0, 7, "FFFF80"]);
GameData.Parts.Hair.push(["Flandre (2)", 116, 0, 0, 0, 0, "FEFDA3"]);
GameData.Parts.Hair.push(["Yuyuko (2)", 117, 0, 0, 0, 0, "FF9999"]);
GameData.Parts.Hair.push(["Kaguya (2)", 118, 0, 0, 0, 0, "444444"]);
GameData.Parts.Hair.push(["Cirno (2A)", 119, 0, 0, 0, 0, "49CAE9"]);
GameData.Parts.Hair.push(["Cirno (2B)", 120, 0, 0, 0, 0, "49CAE9"]);
GameData.Parts.Hair.push(["Eirin (2)", 121, 0, 0, 0, 0, "F2F2F2"]);
GameData.Parts.Hair.push(["Youmu (2)", 122, 0, 0, 0, 0, "F2F2F2"]);
GameData.Parts.Hair.push(["Patchouli (2)", 123, 0, 0, 0, 8, "AB80BF"]);
GameData.Parts.Hair.push(["Alice (2A)", 124, 0, 0, 0, 0, "FFFF80"]);
GameData.Parts.Hair.push(["Alice (2B)", 125, 0, 0, 0, 0, "FFFF80"]);
GameData.Parts.Hair.push(["Reisen (2)", 126, 0, 0, 0, 9, "CB93E3"]);
GameData.Parts.Hair.push(["Mokou (2)", 127, 0, 0, 0, 0, "D9DEE1"]);
GameData.Parts.Hair.push(["Mystia (2)", 128, 0, 0, 0, 0, "F19FAD"]);
GameData.Parts.Hair.push(["Tewi (2)", 129, 0, 0, 0, 0, "333333"]);
GameData.Parts.Hair.push(["Keine (2)", 130, 0, 0, 0, 10, "A0ADDE"]);
GameData.Parts.Hair.push(["Keine (EX2)", 130, 0, 0, 0, 10, "89E063"]);
GameData.Parts.Hair.push(["Ran (2)", 131, 0, 0, 0, 0, "FEE170"]);
GameData.Parts.Hair.push(["Letty (2)", 132, 0, 0, 0, 0, "F3E8FD"]);
GameData.Parts.Hair.push(["Chen (2)", 133, 0, 0, 0, 0, "994D00"]);
GameData.Parts.Hair.push(["Suika (2)", 134, 0, 0, 0, 0, "FEB74E"]);
GameData.Parts.Hair.push(["Murasa", 135, 0, 0, 0, 0, "262626"]);
GameData.Parts.Hair.push(["Shou", 136, 0, 0, 0, 0, "FBFF6C"]);
GameData.Parts.Hair.push(["Byakuren", 137, 0, 0, 0, 0, "C0994C"]);
GameData.Parts.Hair.push(["Nue", 138, 0, 0, 0, 0, "333333"]);
GameData.Parts.Hair.push(["Remilia (2)", 139, 0, 0, 0, 0, "80A2D5"]);
GameData.Parts.Hair.push(["Lily White (2)", 140, 0, 0, 0, 0, "FEFDA3"]);
GameData.Parts.Hair.push(["Lily Black (2)", 140, 0, 0, 0, 0, "F3BB69"]);
GameData.Parts.Hair.push(["Komachi (2)", 141, 0, 0, 0, 0, "CB4545"]);
GameData.Parts.Hair.push(["Nitori (2)", 142, 0, 0, 0, 0, "4B95F6"]);
GameData.Parts.Hair.push(["Reimu (2 Brown)", 112, 0, 0, 0, 0, "6F4722"]);
GameData.Parts.Hair.push(["Sikieiki (2)", 143, 0, 0, 0, 0, "BBD5C5"]);
GameData.Parts.Hair.push(["Byakuren (No Gr.)", 144, 0, 0, 0, 0, "C0994C"]);
GameData.Parts.Hair.push(["Wriggle (2)", 145, 0, 0, 0, 0, "497255"]);
GameData.Parts.Hair.push(["Rumia (2)", 146, 0, 0, 0, 0, "FEF39A"]);
GameData.Parts.Hair.push(["Aya (2)", 147, 0, 0, 0, 0, "373737"]);
GameData.Parts.Hair.push(["Momizi (2)", 148, 0, 0, 0, 0, "FBFBFB"]);
GameData.Parts.Hair.push(["Koakuma (2)", 149, 0, 0, 0, 0, "9C1F1F"]);
GameData.Parts.Hair.push(["Marisa (2)", 150, 0, 0, 0, 0, "FEFE78"]);
GameData.Parts.Hair.push(["Lunasa (2)", 151, 0, 0, 0, 0, "FEF4A3"]);
GameData.Parts.Hair.push(["Merlin (2)", 152, 0, 0, 0, 0, "DDF2FF"]);
GameData.Parts.Hair.push(["Lyrica (2)", 153, 0, 0, 0, 0, "8F7B67"]);
GameData.Parts.Hair.push(["Daiyousei (2)", 154, 0, 0, 0, 0, "A4F4B4"]);
GameData.Parts.Hair.push(["Medicine (2)", 155, 0, 0, 0, 0, "FFF9A4"]);
GameData.Parts.Hair.push(["Yuka (2)", 156, 0, 0, 0, 0, "309C30"]);
GameData.Parts.Hair.push(["Suwako (2)", 157, 0, 0, 0, 0, "FEF7BC"]);
GameData.Parts.Hair.push(["Hina (2)", 158, 0, 0, 0, 11, "87E791"]);
GameData.Parts.Hair.push(["Sanae (2)", 159, 0, 0, 0, 0, "98F898"]);
GameData.Parts.Hair.push(["Kanako (2)", 160, 0, 0, 0, 0, "6767E4"]);
GameData.Parts.Hair.push(["None", 161, 0, 0, 0, 0, "FFFFFF"]);
GameData.Parts.Hair.push(["Minoriko (2)", 162, 0, 0, 0, 0, "FFCC57"]);
GameData.Parts.Hair.push(["Shizuha (2)", 163, 0, 0, 0, 0, "FFF06F"]);
GameData.Parts.Hair.push(["Shinki (2)", 164, 0, 0, 0, 0, "EDEAFB"]);
GameData.Parts.Hair.push(["Mima (2)", 165, 0, 0, 0, 0, "48771A"]);
GameData.Parts.Hair.push(["Reimu (2 Short)", 166, 0, 0, 0, 0, "283960"]);
GameData.Parts.Hair.push(["Rinnosuke (2)", 167, 0, 0, 0, 0, "FBFBFB"]);
GameData.Parts.Hair.push(["Shinki (2 Alt)", 168, 0, 0, 0, 0, "EDEAFB"]);
GameData.Parts.Hair.push(["Rengeteki", 169, 0, 0, 0, 0, "D156D0"]);
GameData.Parts.Hair.push(["Tokiko (2)", 170, 0, 0, 0, 0, "B4CBFE"]);
GameData.Parts.Hair.push(["Sunny Milk (2)", 171, 0, 0, 0, 0, "F7ED8C"]);
GameData.Parts.Hair.push(["Star Sapphire (2A)", 172, 0, 0, 0, 12, "444444"]);
GameData.Parts.Hair.push(["Star Sapphire (2B)", 173, 0, 0, 0, 12, "444444"]);
GameData.Parts.Hair.push(["Hatate", 174, 0, 0, 0, 0, "40351E"]);
GameData.Parts.Hair.push(["Luna Child (2)", 175, 0, 0, 0, 0, "FFFF5E"]);
GameData.Parts.Hair.push(["Akyu (2)", 176, 0, 0, 0, 0, "984499"]);
GameData.Parts.Hair.push(["Rinnosuke (2 Alt)", 177, 0, 0, 0, 0, "FBFBFB"]);
GameData.Parts.Hair.push(["Renko (2)", 178, 0, 0, 0, 0, "634D2E"]);
GameData.Parts.Hair.push(["Marisa (SoEW)", 179, 0, 0, 0, 0, "A22222"]);
GameData.Parts.Hair.push(["Maribel (2)", 180, 0, 0, 0, 0, "FFF177"]);
GameData.Parts.Hair.push(["Sanae (No Snake)", 181, 0, 0, 0, 0, "98F898"]);
GameData.Parts.Hair.push(["Yamame (2)", 182, 0, 0, 0, 0, "FEF1C4"]);
GameData.Parts.Hair.push(["Chiyuri (2)", 183, 0, 0, 0, 0, "FEFD81"]);
GameData.Parts.Hair.push(["Yumemi (2)", 184, 0, 0, 0, 0, "AA2B2B"]);
GameData.Parts.Hair.push(["Reimu (2 Alt)", 185, 0, 0, 0, 0, "283960"]);
GameData.Parts.Hair.push(["Cirno (2 Fire)", 119, 0, 0, 0, 0, "CC0000"]);
GameData.Parts.Hair.push(["Reimu (PC-98 2)", 186, 0, 0, 0, 13, "890099"]);
GameData.Parts.Hair.push(["Keine (2 Alt)", 187, 0, 0, 0, 0, "EAEAEA"]);
GameData.Parts.Hair.push(["Shou (Alt)", 188, 0, 0, 0, 0, "FBFF6C"]);
GameData.Parts.Hair.push(["Zombie Fairy (Alt)", 189, 0, 0, 0, 0, "D9DDFF"]);
GameData.Parts.Hair.push(["Flat", 190, 0, 0, 0, 0, "333333"]);
GameData.Parts.Hair.push(["Spiky", 191, 0, 0, 0, 0, "333333"]);
GameData.Parts.Hair.push(["Tenshi (2A)", 192, 0, 0, 0, 0, "2987C5"]);
GameData.Parts.Hair.push(["Reimu (2 None)", 193, 0, 0, 0, 0, "283960"]);
GameData.Parts.Hair.push(["Reimu (2 Short None)", 194, 0, 0, 0, 0, "283960"]);
GameData.Parts.Hair.push(["Reimu (2 Alt None)", 195, 0, 0, 0, 0, "283960"]);
GameData.Parts.Hair.push(["Fauxhawk", 196, 0, 0, 0, 0, "333333"]);
GameData.Parts.Hair.push(["Iku (2)", 197, 0, 0, 0, 0, "8C75EA"]);
GameData.Parts.Hair.push(["Tenshi (2B)", 198, 0, 0, 0, 0, "2987C5"]);
GameData.Parts.Hair.push(["Sakuya (Inu)", 199, 0, 0, 0, 6, "E6E6E6"]);
GameData.Parts.Hair.push(["Yuugi (2)", 200, 0, 0, 0, 0, "EFDDAF"]);
GameData.Parts.Hair.push(["Kisume (2A)", 201, 0, 0, 0, 0, "20AD79"]);
GameData.Parts.Hair.push(["Kisume (2B)", 202, 0, 0, 0, 0, "20AD79"]);
GameData.Parts.Hair.push(["Parsee (2)", 203, 0, 0, 0, 0, "F9E586"]);
GameData.Parts.Hair.push(["Utsuho (2)", 204, 0, 0, 0, 0, "3C3C3C"]);
GameData.Parts.Hair.push(["Orin (2)", 205, 0, 0, 0, 0, "D76464"]);
GameData.Parts.Hair.push(["Satori (2)", 206, 0, 0, 0, 0, "E3BBFF"]);
GameData.Parts.Hair.push(["Sin Sack", 207, 0, 0, 0, 0, "C0FFEE"]);
GameData.Parts.Hair.push(["Koishi (2)", 208, 0, 0, 0, 0, "DFFDE1"]);
GameData.Parts.Hair.push(["Mohawk", 209, 0, 0, 0, 0, "298975"]);
GameData.Parts.Hair.push(["Kasen", 210, 0, 0, 0, 0, "DA5899"]);
GameData.Parts.Hair.push(["Pigtail", 211, 0, 0, 0, 0, "B30000"]);
GameData.Parts.Hair.push(["Mitori", 212, 0, 0, 0, 0, "EF8F8F"]);
GameData.Parts.Hair.push(["Sasha", 213, 0, 0, 0, 0, "7EC3FA"]);
GameData.Parts.Hair.push(["Sakuya (Inu Alt)", 214, 0, 0, 0, 0, "E6E6E6"]);
GameData.Parts.Hair.push(["Yorihime (2)", 215, 0, 0, 0, 0, "D6CBDE"]);
GameData.Parts.Hair.push(["Toyohime (2)", 216, 0, 0, 0, 0, "FEEDB9"]);
GameData.Parts.Hair.push(["Youki (2)", 217, 0, 0, 0, 0, "F7F7F7"]);
GameData.Parts.Hair.push(["Alice (PC-98)(2)", 218, 0, 0, 0, 0, "FEFE54"]);
GameData.Parts.Hair.push(["Kurumi (2)", 219, 0, 0, 0, 0, "FFFF77"]);
GameData.Parts.Hair.push(["Marisa (PC-98)(2)", 220, 0, 0, 0, 0, "FEFE54"]);
GameData.Parts.Hair.push(["Luize (2)", 221, 0, 0, 0, 0, "FEFDAB"]);
GameData.Parts.Hair.push(["Yumeko (2)", 222, 0, 0, 0, 0, "FEFE70"]);
GameData.Parts.Hair.push(["Ruukoto (2)", 223, 0, 0, 0, 0, "70FE70"]);
GameData.Parts.Hair.push(["Sasha (Alt)", 224, 0, 0, 0, 0, "7EC3FA"]);
GameData.Parts.Hair.push(["Mugetsu (2)", 225, 0, 0, 0, 0, "FEFD89"]);
GameData.Parts.Hair.push(["Gengetsu (2)", 226, 0, 0, 0, 0, "FFFF5E"]);
GameData.Parts.Hair.push(["Sariel (2A)", 227, 0, 0, 0, 0, "DDDDFF"]);
GameData.Parts.Hair.push(["Sariel (2B)", 228, 0, 0, 0, 0, "DDDDFF"]);
GameData.Parts.Hair.push(["Konngara (2A)", 229, 0, 0, 0, 0, "3C3C3C"]);
GameData.Parts.Hair.push(["Konngara (2B)", 230, 0, 0, 0, 0, "3C3C3C"]);
GameData.Parts.Hair.push(["Konngara (2C)", 231, 0, 0, 0, 0, "3C3C3C"]);
GameData.Parts.Hair.push(["Kotohime (2)", 232, 0, 0, 0, 14, "BF0000"]);
GameData.Parts.Hair.push(["Orange (2A)", 233, 0, 0, 0, 0, "EB585A"]);
GameData.Parts.Hair.push(["Orange (2B)", 234, 0, 0, 0, 0, "EB585A"]);
GameData.Parts.Hair.push(["Rikako (2)", 235, 0, 0, 0, 0, "980198"]);
GameData.Parts.Hair.push(["Headless", 236, 0, 0, 0, 0, "C0FFEE"]);
GameData.Parts.Hair.push(["Rika (2A)", 237, 0, 0, 0, 0, "7A380E"]);
GameData.Parts.Hair.push(["Rika (2B)", 238, 0, 0, 0, 0, "7A380E"]);
GameData.Parts.Hair.push(["Yuki (2)", 239, 0, 0, 0, 0, "FEFE54"]);
GameData.Parts.Hair.push(["VIVIT (2)", 240, 0, 0, 0, 0, "ED5F5F"]);
GameData.Parts.Hair.push(["Mai (2)", 241, 0, 0, 0, 0, "ABABFE"]);
GameData.Parts.Hair.push(["Ellen (2)", 242, 0, 0, 0, 0, "FEFD92"]);
GameData.Parts.Hair.push(["Kana (2)", 243, 0, 0, 0, 0, "FFFFA2"]);
GameData.Parts.Hair.push(["Elly (2)", 244, 0, 0, 0, 0, "FFFF88"]);
GameData.Parts.Hair.push(["Sara (2)", 245, 0, 0, 0, 0, "EFABBA"]);
GameData.Parts.Hair.push(["Meira (2)", 246, 0, 0, 0, 0, "B835B9"]);
GameData.Parts.Hair.push(["Elis (2)", 247, 0, 0, 0, 0, "EEED09"]);
GameData.Parts.Hair.push(["Shingyoku F (2)", 248, 0, 0, 0, 0, "D22D2D"]);
GameData.Parts.Hair.push(["Shingyoku M (2)", 249, 0, 0, 0, 0, "393939"]);
GameData.Parts.Hair.push(["Yuka (PJ's 2)", 250, 0, 0, 0, 0, "23AB23"]);
GameData.Parts.Hair.push(["Yukari (PCB 2)", 251, 0, 0, 0, 0, "FFFF80"]);
GameData.Parts.Hair.push(["Nazrin (2)", 252, 0, 0, 0, 0, "969696"]);
GameData.Parts.Hair.push(["Kogasa (2)", 253, 0, 0, 0, 0, "6AA8AE"]);
GameData.Parts.Hair.push(["Yukari (2)", 254, 0, 0, 0, 7, "FFFF80"]);
GameData.Parts.Hair.push(["Ichirin (2)", 255, 0, 0, 0, 0, "B8BCE0"]);
GameData.Parts.Hair.push(["Shanghai (2)", 256, 0, 0, 0, 0, "FFFF80"]);
GameData.Parts.Hair.push(["Kyouko", 257, 0, 0, 0, 0, "007075"]);
GameData.Parts.Hair.push(["Yoshika", 258, 0, 0, 0, 0, "5E6283"]);
GameData.Parts.Hair.push(["Seiga", 259, 0, 0, 0, 0, "3D6EA1"]);
GameData.Parts.Hair.push(["Tojiko", 260, 0, 0, 0, 0, "C5D1AF"]);
GameData.Parts.Hair.push(["Futo", 261, 0, 0, 0, 0, "A8A8A8"]);
GameData.Parts.Hair.push(["Miko", 262, 0, 0, 0, 0, "C3B594"]);
GameData.Parts.Hair.push(["Mamizou", 263, 0, 0, 0, 0, "8A5D5D"]);
GameData.Parts.Hair.push("random");
GameData.Parts.Eyes = new Array();
GameData.Parts.Eyes.push(["Eye 1", 1, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 2", 2, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 3", 3, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 4", 4, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 5", 5, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 6", 6, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 7", 7, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 8", 8, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 9", 9, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 10", 10, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 11", 11, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 12", 12, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 13", 13, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 14", 14, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 15", 15, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 16", 16, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 17", 17, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 18", 18, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 19", 19, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 20", 20, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 21", 21, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 22", 22, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 23", 23, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 24", 24, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 25", 25, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 26", 26, 0, 7, 0, 1]);
GameData.Parts.Eyes.push(["Eye 27", 27, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 28", 28, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 29", 29, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 30", 30, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 31", 31, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 32", 32, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 33", 33, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 34", 34, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 35", 35, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 36", 36, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 37", 37, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 38", 38, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 39", 39, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 40", 40, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 41", 41, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 42", 42, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 43", 43, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 44", 44, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 45", 45, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 46", 46, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 47", 47, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 48", 48, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 49", 49, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 50", 50, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 51", 51, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 52", 52, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 53", 53, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 54", 54, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 55", 55, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 56", 56, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 57", 57, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 58", 58, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 59", 59, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 60", 60, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 61", 61, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 62", 62, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 63", 63, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 64", 64, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 65", 65, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 66", 66, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 67", 67, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 68", 68, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 69", 69, 0, 7, 0, 2]);
GameData.Parts.Eyes.push(["Eye 70", 70, 0, 7, 0, 3]);
GameData.Parts.Eyes.push(["Eye 71", 71, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 72", 72, 0, 7, 0, 4]);
GameData.Parts.Eyes.push(["Eye 73", 73, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 74", 74, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 75", 75, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 76", 76, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 77", 77, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 78", 78, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 79", 79, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 80", 80, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 81", 81, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 82", 82, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 83", 83, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 84", 84, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 85", 85, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 86", 86, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 87", 87, 0, 7, 0, 5]);
GameData.Parts.Eyes.push(["Eye 88", 88, 0, 0, 0, 0]);
GameData.Parts.Eyes.push(["Eye 89", 89, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 90", 90, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 91", 91, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 92", 92, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 93", 93, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 94", 94, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 95", 95, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 96", 96, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 97", 97, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 98", 98, 0, 7, 0, 6]);
GameData.Parts.Eyes.push(["Eye 99", 99, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 100", 100, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 101", 101, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 102", 102, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 103", 103, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 104", 104, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 105", 105, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 106", 106, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 107", 107, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 108", 108, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 109", 109, 0, 7, 0, 7]);
GameData.Parts.Eyes.push(["Eye 110", 110, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 111", 111, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 112", 112, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 113", 113, 0, 7, 0, 2]);
GameData.Parts.Eyes.push(["Eye 114", 114, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 115", 115, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 116", 116, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 117", 117, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 118", 118, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 119", 119, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 120", 120, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 121", 121, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 122", 122, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 123", 123, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 124", 124, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 125", 125, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 126", 126, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 127", 127, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 128", 128, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 129 (None)", 129, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 130", 130, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 131", 131, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 132", 132, 0, 7, 0, 0]);
GameData.Parts.Eyes.push(["Eye 133", 133, 0, 7, 0, 0]);
GameData.Parts.Eyes.push("random");
GameData.Parts.Mouth = new Array();
GameData.Parts.Mouth.push("none");
GameData.Parts.Mouth.push(["Mouth 1", 1, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 2", 2, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 3", 3, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 4", 4, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 5", 5, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 6", 6, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 7", 7, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 8", 8, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 9", 9, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 10", 10, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 11", 11, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 12", 12, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 13", 13, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 14", 14, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 15", 15, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 16", 16, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 17", 17, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 18", 18, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 19", 19, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 20", 20, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 21", 21, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 22", 22, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 23", 23, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 24", 24, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 25", 25, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 26", 26, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 27", 27, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 28", 28, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 29", 29, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 30", 30, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 31", 31, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 32", 32, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 33", 33, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 34", 34, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 35", 35, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 36", 36, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 37", 37, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 38", 38, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 39", 39, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 40", 40, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 41", 41, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 42", 42, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 43", 43, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 44", 44, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 45", 45, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 46", 46, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 47", 47, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 48", 48, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 49", 49, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 50", 50, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 51", 51, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 52", 52, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 53", 53, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 54", 54, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 55", 55, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 56", 56, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 57", 57, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 58", 58, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 59", 59, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 60", 60, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 61", 61, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 62", 62, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 63", 63, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 64", 64, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 65", 65, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 66", 66, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 67", 67, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 68", 68, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 69", 69, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 70", 70, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 71", 71, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 72", 72, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 73", 73, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 74", 74, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 75", 75, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 76", 76, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 77", 77, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 78", 78, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 79", 79, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 80", 80, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 81", 81, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 82", 82, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 83", 83, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 84", 84, 0, 0, 0]);
GameData.Parts.Mouth.push(["Mouth 85", 85, 0, 0, 0]);
GameData.Parts.Mouth.push("random");
GameData.BGs = new Array();
GameData.BGs.push("none");
GameData.BGs.push(["Scarlet Mansion", 1]);
GameData.BGs.push(["Flandre's Room", 2]);
GameData.BGs.push(["Yukari's Bedroom", 3]);
GameData.BGs.push(["Yukari's House", 4]);
GameData.BGs.push(["Yukari's Yard", 5]);
GameData.BGs.push(["Scarlet Library", 6]);
GameData.BGs.push(["Night Mountain", 7]);
GameData.BGs.push(["Magic Forest", 8]);
GameData.BGs.push(["Marisa's House", 9]);
GameData.BGs.push(["Hakurei Shrine", 10]);
GameData.BGs.push(["Alice's Room", 11]);
GameData.BGs.push(["Alice's House", 12]);
GameData.BGs.push(["Yuyuko's Hallway", 13]);
GameData.BGs.push(["Yuyuko's Kitchen", 14]);
GameData.BGs.push(["Sakura Tree 1", 15]);
GameData.BGs.push(["Sakura Tree 2", 16]);
GameData.BGs.push(["Shrine Day", 25]);
GameData.BGs.push(["Shrine Night", 17]);
GameData.BGs.push(["Bamboo Forest", 18]);
GameData.BGs.push(["K-1 Classroom 1", 19]);
GameData.BGs.push(["K-1 Classroom 2", 20]);
GameData.BGs.push(["K-1 Classroom 3", 21]);
GameData.BGs.push(["K-1 Classroom 4", 22]);
GameData.BGs.push(["Snow Field", 23]);
GameData.BGs.push(["Bar", 24]);
GameData.BGs.push(["Reimu Burger Register", 26]);
GameData.BGs.push(["Reimu Burger Kitchen", 27]);
GameData.BGs.push(["Reimu Burger Diner", 28]);
GameData.BGs.push(["Reimu Burger Dead End", 30]);
GameData.BGs.push(["Reimu Burger Hallway", 31]);
GameData.BGs.push(["Cruise Ship Entrance", 32]);
GameData.BGs.push(["Cruise Ship Room", 33]);
GameData.BGs.push(["Cruise Ship Deck", 34]);
GameData.BGs.push(["The Dock", 35]);
GameData.BGs.push(["More Forest", 36]);
GameData.BGs.push(["Bamboo Forest Zoom!", 37]);
GameData.BGs.push(["Desktop", 38]);
GameData.BGs.push(["Random Color", 39]);
GameData.BGs.push(["Fusion Lab", 40]);
GameData.BGs.push(["Open Field", 41]);
GameData.BGs.push(["Open Field Dusk", 42]);
GameData.BGs.push(["Aya's House", 43]);
GameData.BGs.push(["Random Field", 44]);
GameData.BGs.push(["Scarlet X-Mas Tree", 45]);
GameData.BGs.push(["Reimu's Room", 46]);
GameData.BGs.push(["Reimu Burger X-Mas", 47]);
GameData.BGs.push(["Reimu's X-Mas Room", 48]);
GameData.BGs.push(["Empty Room", 49]);
GameData.BGs.push(["Sketchy Room", 50]);
GameData.BGs.push(["Sketchy Boxing Ring", 51]);
GameData.BGs.push(["Sketchy Field", 52]);
GameData.BGs.push(["Sketchy Snowfield", 53]);
GameData.BGs.push(["Sketchy BG", 54]);
GameData.BGs.push(["Sketchy Reimu's Room", 55]);
GameData.BGs.push(["Moriya Shrine Steps", 56]);
GameData.BGs.push(["Moriya Shrine Room", 57]);
GameData.BGs.push(["Moriya Shrine Yard", 58]);
GameData.BGs.push(["Moriya Shrine Opening", 59]);
GameData.BGs.push(["Moriya Shrine Room", 60]);
GameData.BGs.push(["It's a forest again", 61]);
GameData.BGs.push(["And another forest!", 62]);
GameData.BGs.push(["End of Gensokyo", 63]);
GameData.BGs.push(["Yuka Fight!!", 64]);
GameData.BGs.push(["Reimu's Door", 65]);
GameData.BGs.push(["Reimu's Door Open", 75]);
GameData.BGs.push(["Moriya Shrine Door", 66]);
GameData.BGs.push(["Alice in the Forest", 67]);
GameData.BGs.push(["Boxing Ring", 68]);
GameData.BGs.push(["Island", 69]);
GameData.BGs.push(["Saigyou Ayakashi", 70]);
GameData.BGs.push(["Imageboard", 71]);
GameData.BGs.push(["Yard with Chairs", 72]);
GameData.BGs.push(["Moriya Kotatsu", 73]);
GameData.BGs.push(["Hakurei Shrine Door", 74]);
GameData.BGs.push(["Death by Yuyuko", 76]);
GameData.BGs.push(["Reimu Burger Outside", 77]);
GameData.BGs.push(["MikoMart Outside", 78]);
GameData.BGs.push(["MikoMart Inside", 79]);
GameData.BGs.push(["MikoMart Outside 2", 80]);
GameData.BGs.push(["Reimu's Room Again", 81]);
GameData.BGs.push(["Shrine Exterior", 82]);
GameData.BGs.push(["Hakugyokurou", 83]);
GameData.BGs.push(["Some Mountain", 84]);
GameData.BGs.push(["Generic Sky", 85]);
GameData.BGs.push(["Mansion Gates", 86]);
GameData.BGs.push(["Mansion Path", 87]);
GameData.BGs.push(["Scarlet Hallway", 88]);
GameData.BGs.push(["The Moon", 89]);
GameData.BGs.push(["Beach", 90]);
GameData.BGs.push(["School Hallway", 91]);
GameData.BGs.push(["Mini-Stage", 92]);
GameData.BGs.push(["Pond", 93]);
GameData.BGs.push(["Another Field", 94]);
GameData.BGs.push(["Marisa's House 2", 95]);
GameData.BGs.push(["Nuclear Sector", 96]);
GameData.BGs.push(["Graveyard", 97]);
GameData.BGs.push(["Underground Cave", 98]);
GameData.BGs.push(["M. Shrine (No Signs)", 99]);
GameData.BGs.push(["M. Shrine (Snow)", 100]);
GameData.BGs.push(["River", 101]);
GameData.BGs.push(["Dark Room", 102]);
GameData.BGs.push(["City Street", 103]);
GameData.BGs.push(["Eientei", 104]);
GameData.BGs.push(["Green Tatami", 105]);
GameData.BGs.push(["Kourindou", 106]);
GameData.BGs.push(["Nines", 107]);
GameData.BGs.push(["Hearts", 108]);
GameData.BGs.push(["The Heavens", 109]);
GameData.BGs.push(["Trees n' Grass", 110]);
GameData.BGs.push(["Basement Sideview", 111]);
GameData.BGs.push(["K-1 Classroom 5", 112]);
GameData.BGs.push(["K-1 Classroom 6", 113]);
GameData.BGs.push(["Scarlet Library 2", 114]);
GameData.BGs.push(["Scarlet Lib. Door", 115]);
GameData.BGs.push(["S.Ayakashi (Dead)", 116]);
GameData.BGs.push(["Onbashiras (Night)", 117]);
GameData.BGs.push(["Mountain Silhouette", 118]);
GameData.BGs.push(["S.Ayakashi (Dead2)", 119]);
GameData.BGs.push(["Onbashiras (Day)", 120]);
GameData.BGs.push(["Snowy", 121]);
GameData.BGs.push(["Autumn 1", 122]);
GameData.BGs.push(["General classroom", 123]);
GameData.BGs.push(["Lakeside", 124]);
GameData.BGs.push(["Lakeside (Snowy)", 125]);
GameData.BGs.push(["Cartoony Background", 126]);
GameData.BGs.push(["Makai", 127]);
GameData.BGs.push(["Houkai", 128]);
GameData.BGs.push(["Clocktower", 129]);
GameData.BGs.push(["Murasa's Ship", 130]);
GameData.BGs.push(["Murasa's Ship (2)", 131]);
GameData.BGs.push(["Geyser", 132]);
GameData.BGs.push(["Geyser (2)", 133]);
GameData.BGs.push(["Autumn 2", 134]);
GameData.BGs.push(["Mountain Sunset", 135]);
GameData.BGs.push(["Hakurei Shrine (IaMP)", 136]);
GameData.BGs.push(["Hakurei Shrine Night", 137]);
GameData.BGs.push(["Shrine Tori", 138]);
GameData.BGs.push(["Shrine Tori 2", 139]);
GameData.BGs.push(["SDM outside", 140]);
GameData.BGs.push(["Frozen Lake", 141]);
GameData.BGs.push(["Prismriver Fight", 142]);
GameData.BGs.push(["SDM gate", 143]);
GameData.BGs.push(["SDM Side", 144]);
GameData.BGs.push(["Utsuho Stage", 145]);
GameData.BGs.push(["Mountain Steps", 146]);
GameData.BGs.push(["Crater", 147]);
GameData.BGs.push(["Nameless Hill", 148]);
GameData.BGs.push(["Nameless Hill 2", 149]);
GameData.BGs.push(["Marisa's House 3", 150]);
GameData.BGs.push(["Sunset Branches", 151]);
GameData.BGs.push(["Yin-Yang Lift", 152]);
GameData.BGs.push(["Destroyed Shrine 1", 153]);
GameData.BGs.push(["Destroyed Shrine 2", 154]);
GameData.BGs.push(["Sunflower Field", 155]);
GameData.BGs.push(["Alice's House 2", 156]);
GameData.BGs.push(["SDM Balcony", 157]);
GameData.BGs.push(["Waterfall", 158]);
GameData.BGs.push(["Outer Space 1", 159]);
GameData.BGs.push(["Outer Space 2", 160]);
GameData.BGs.push(["Spaceship Inside 1", 161]);
GameData.BGs.push(["Spaceship Inside 2", 162]);
GameData.BGs.push(["Red Moon", 163]);
GameData.BGs.push(["Lake Suwa", 164]);
GameData.BGs.push(["SDM Throne Room", 165]);
GameData.BGs.push(["Hakurei Shrine (Border)", 166]);
GameData.BGs.push(["Scarlet Hallway 2", 167]);
GameData.BGs.push(["Eientei Hallway", 168]);
GameData.BGs.push(["Moon Corridor", 169]);
GameData.BGs.push(["Gothic Cemetery", 170]);
GameData.BGs.push(["Mountain Waterfall", 171]);
GameData.BGs.push(["Courtroom", 172]);
GameData.BGs.push(["Hell of Blazing Fires", 173]);
GameData.BGs.push(["Kourindou Outside", 174]);
GameData.BGs.push(["Zen Garden Night", 175]);
GameData.BGs.push(["Zen Garden Day", 176]);
GameData.BGs.push(["Zen Garden Snow", 177]);
GameData.BGs.push(["Scarlet Bedroom", 178]);
GameData.BGs.push(["Swirly Vortex", 179]);
GameData.BGs.push(["Yukari's Gap", 180]);
GameData.BGs.push(["Tennis Court", 181]);
GameData.BGs.push(["Cathedral", 182]);
GameData.BGs.push(["Underground Mine", 183]);
GameData.BGs.push(["Computer Grid", 184]);
GameData.BGs.push(["Eientei Outside", 185]);
GameData.BGs.push(["Eientei Courtyard", 186]);
GameData.BGs.push(["Waterfall (Spring)", 187]);
GameData.BGs.push(["Alice's Room 2", 188]);
GameData.BGs.push(["Lunar Capital", 189]);
GameData.BGs.push(["Stairs", 190]);
GameData.BGs.push(["Newspaper Template", 191]);
GameData.BGs.push(["Under the Sea", 192]);
GameData.BGs.push(["Shrine Entrance", 193]);
GameData.BGs.push(["Street Intersection", 194]);
GameData.BGs.push(["Dancefloor", 195]);
GameData.BGs.push(["TV Static", 196]);
GameData.BGs.push(["Ship Deck", 197]);
GameData.BGs.push(["Gaia Library", 198]);
GameData.BGs.push(["SDM Library", 199]);
GameData.BGs.push(["Mushroom Forest", 200]);
GameData.BGs.push(["Ruined Red Shrine", 201]);
GameData.BGs.push(["Human Village", 202]);
GameData.BGs.push(["Bar 2", 203]);
GameData.BGs.push(["Cathedral Ruins", 204]);
GameData.BGs.push(["Forest Night 1", 205]);
GameData.BGs.push(["Forest Night 2", 206]);
GameData.BGs.push(["Lunar Capital Interior", 207]);
GameData.BGs.push(["Basketball Court", 208]);
GameData.BGs.push(["Spider Web", 209]);
GameData.BGs.push(["Field (Day)", 210]);
GameData.BGs.push(["Field (Sunset)", 211]);
GameData.BGs.push(["Field (Night)", 212]);
GameData.BGs.push(["Clocktower (Sunset)", 213]);
GameData.BGs.push(["Clocktower (Night)", 214]);
GameData.BGs.push(["Earth from Space", 215]);
GameData.BGs.push(["Cathedral (Red)", 216]);
GameData.BGs.push(["Ten Desires Stage 4", 217]);
GameData.BGs.push(["Myouren Temple Path", 218]);
GameData.BGs.push("random");
GameData.ObjectArray = new Array();
GameData.ObjectArray.push(["TV Set", 1, 4, 1, -6]);
GameData.ObjectArray.push(["Miko's Computer", 2, 5, 0, -2]);
GameData.ObjectArray.push(["Aya Box", 3, 5, 0, -5]);
GameData.ObjectArray.push(["Sketchy Comp", 4, 5, 2, -3]);
GameData.ObjectArray.push(["Robotic Arm", 5, 0, 4, 0]);
GameData.ObjectArray.push(["Grill", 6, 6, -1, -2]);
GameData.ObjectArray.push(["Cash Register", 7, 5, 0, -3]);
GameData.ObjectArray.push(["Barstool", 8, 3, 0, 0]);
GameData.ObjectArray.push(["Bar Counter", 9, 6, 0, -4]);
GameData.ObjectArray.push(["Pet Bunny", 10, 5, 0, 0]);
GameData.ObjectArray.push(["Shanghai", 11, 5, 0, 0]);
GameData.ObjectArray.push(["Myon", 12, 5, 0, 0]);
GameData.ObjectArray.push(["Mic Stand", 13, 5, 0, 0]);
GameData.ObjectArray.push(["Chen ", 14, 5, 0, 0]);
GameData.ObjectArray.push(["Chen 2", 15, 5, 0, 0]);
GameData.ObjectArray.push(["Chen 3", 17, 5, 0, 0]);
GameData.ObjectArray.push(["FOE", 16, 5, 0, 0]);
GameData.ObjectArray.push(["Robot", 18, 5, 0, 0]);
GameData.ObjectArray.push(["Box", 19, 5, 0, 0]);
GameData.ObjectArray.push(["Chair", 20, 5, 0, -2]);
GameData.ObjectArray.push(["Frozen Frog", 21, 5, 0, 0]);
GameData.ObjectArray.push(["Watermelon", 22, 5, 0, 0]);
GameData.ObjectArray.push(["Moriya Kotatsu", 23, 5, 0, -3]);
GameData.ObjectArray.push(["Twuck", 24, 4, 0, 5]);
GameData.ObjectArray.push(["Gungnir", 25, 3, 0, -3]);
GameData.ObjectArray.push(["Sigh Breath", 26, 5, 0, 0]);
GameData.ObjectArray.push(["Aya's Cabinet", 27, 6, 0, -3]);
GameData.ObjectArray.push(["Aya's Computer", 28, 5, 0, -5]);
GameData.ObjectArray.push(["Ayangelion", 29, 4, 2, -6]);
GameData.ObjectArray.push(["Cirno Suika", 30, 5, 2, -6]);
GameData.ObjectArray.push(["Refrigerator", 31, 5, 1, -4]);
GameData.ObjectArray.push(["Ikubi Akius", 32, 5, 3, -6]);
GameData.ObjectArray.push(["M.Mart Counter", 33, 5, 3, -4]);
GameData.ObjectArray.push(["Radio", 34, 5, 3, 5]);
GameData.ObjectArray.push(["Reimu's Kotatsu", 35, 5, 0, 0]);
GameData.ObjectArray.push(["Burger Table", 36, 5, 0, -3]);
GameData.ObjectArray.push(["Sakura Tree", 37, 5, 3, -5]);
GameData.ObjectArray.push(["Sliding Door", 38, 5, 0, -5]);
GameData.ObjectArray.push(["Trash Can", 39, 5, 2, 0]);
GameData.ObjectArray.push(["Suzuran", 40, 5, 0, 5]);
GameData.ObjectArray.push(["Some Flower", 41, 5, 0, 0]);
GameData.ObjectArray.push(["Sunflower", 42, 5, 0, 0]);
GameData.ObjectArray.push(["Miko Stick", 43, 5, 0, 0]);
GameData.ObjectArray.push(["Youkai Warhead", 44, 5, 0, -3]);
GameData.ObjectArray.push(["Blanket", 45, 5, 0, -3]);
GameData.ObjectArray.push(["Matress", 46, 5, 0, -3]);
GameData.ObjectArray.push(["Rain Cloud", 47, 5, 0, -3]);
GameData.ObjectArray.push(["Fire", 48, 5, 0, -3]);
GameData.ObjectArray.push(["Light", 49, 5, 3, -7]);
GameData.ObjectArray.push(["Gap", 50, 5, 0, -3]);
GameData.ObjectArray.push(["Comic Panel", 51, 5, 0, -3]);
GameData.ObjectArray.push(["Point Item", 52, 5, 0, 5]);
GameData.ObjectArray.push(["Powerup Item", 53, 5, 0, 5]);
GameData.ObjectArray.push(["Pong Paddle", 54, 5, 0, -3]);
GameData.ObjectArray.push(["Barrier", 55, 5, 0, -4]);
GameData.ObjectArray.push(["Bullet (Yukari's)", 56, 5, 0, 5]);
GameData.ObjectArray.push(["Bullet 01", 57, 5, 0, 20]);
GameData.ObjectArray.push(["Bullet 02", 58, 5, 0, 20]);
GameData.ObjectArray.push(["Bullet 03", 59, 5, 0, 20]);
GameData.ObjectArray.push(["Bullet 04", 60, 5, 0, 20]);
GameData.ObjectArray.push(["Bullet 05", 61, 5, 0, 30]);
GameData.ObjectArray.push(["Bullet 06", 62, 5, 0, 20]);
GameData.ObjectArray.push(["Bullet 07", 63, 5, 0, 20]);
GameData.ObjectArray.push(["Bullet (Yin-Yang)", 64, 5, 0, 20]);
GameData.ObjectArray.push(["Amulet", 65, 5, 0, 15]);
GameData.ObjectArray.push(["Bullet (Knife)", 66, 5, 0, 5]);
GameData.ObjectArray.push(["Levatein", 67, 5, 0, 0]);
GameData.ObjectArray.push(["Camera", 68, 5, 0, 5]);
GameData.ObjectArray.push(["Bullet (Ice)", 69, 5, 0, 30]);
GameData.ObjectArray.push(["Witch Broom", 70, 0, 0, 0]);
GameData.ObjectArray.push(["Crescent Spear", 71, 0, 0, 0]);
GameData.ObjectArray.push(["Youmu Sword", 72, 5, 0, 0]);
GameData.ObjectArray.push(["Dark Sword", 73, 5, 0, 0]);
GameData.ObjectArray.push(["Arms (Ran's)", 74, 5, 0, 10]);
GameData.ObjectArray.push(["Basket", 75, 5, 0, 10]);
GameData.ObjectArray.push(["Bucket", 76, 5, 0, 0]);
GameData.ObjectArray.push(["Wanted Poster", 77, 5, 0, -3]);
GameData.ObjectArray.push(["Tenshi's Rock", 78, 5, 2, 0]);
GameData.ObjectArray.push(["Cloud", 79, 5, 0, -3]);
GameData.ObjectArray.push(["Tenshi's Sword", 80, 5, 0, 0]);
GameData.ObjectArray.push(["Rocket", 81, 5, 2, 0]);
GameData.ObjectArray.push(["Evil Eye Sigma", 82, 5, 0, -3]);
GameData.ObjectArray.push(["Darkness", 83, 5, 0, -3]);
GameData.ObjectArray.push(["Sketchy M.Spark", 84, -3, 0, -3]);
GameData.ObjectArray.push(["Arms (Extended)", 85, 5, 0, 2]);
GameData.ObjectArray.push(["Steamroller", 86, 5, 0, -4]);
GameData.ObjectArray.push(["Donation Box", 87, 5, 0, 0]);
GameData.ObjectArray.push(["Cat", 88, 5, 0, 0]);
GameData.ObjectArray.push(["Clock", 89, 5, 2, 0]);
GameData.ObjectArray.push(["Cat-on-a-Cup", 90, 5, 2, 2]);
GameData.ObjectArray.push(["Lemonade Pitcher", 91, 5, 2, 1]);
GameData.ObjectArray.push(["Product Stand", 92, 5, 2, -3]);
GameData.ObjectArray.push(["Kendama", 93, 5, 0, 0]);
GameData.ObjectArray.push(["Master Spark!!", 94, 0, 0, -9]);
GameData.ObjectArray.push(["Censor Bar", 95, 5, 0, 0]);
GameData.ObjectArray.push(["Sparkler", 96, 5, 0, 6]);
GameData.ObjectArray.push(["Outdoor Grill", 97, 5, 5, -3]);
GameData.ObjectArray.push(["Beach Umbrella", 98, 5, -5, -1]);
GameData.ObjectArray.push(["Beach Blanket", 99, 5, 0, 0]);
GameData.ObjectArray.push(["Sandcastle", 100, 5, 0, 4]);
GameData.ObjectArray.push(["Meat Patty", 101, 5, 0, 6]);
GameData.ObjectArray.push(["Inner Tube", 102, 5, 0, 3]);
GameData.ObjectArray.push(["Sign", 103, 5, 0, 3]);
GameData.ObjectArray.push(["Puddle", 104, 5, 0, 0]);
GameData.ObjectArray.push(["Umbrella", 105, 5, 2, -3]);
GameData.ObjectArray.push(["Nuclear Warning", 106, 5, 0, 3]);
GameData.ObjectArray.push(["Spinning Sun", 107, 5, 2, -3]);
GameData.ObjectArray.push(["Nuclear Reactor", 108, 5, 1, -6]);
GameData.ObjectArray.push(["Skull", 109, 5, 0, 4]);
GameData.ObjectArray.push(["Ghostly Aura", 110, 6, 0, 4]);
GameData.ObjectArray.push(["Wheelbarrow", 111, 5, 0, 0]);
GameData.ObjectArray.push(["Orin", 112, 5, 0, 0]);
GameData.ObjectArray.push(["Gravestone", 113, 5, 0, 0]);
GameData.ObjectArray.push(["Suika's Gourd", 114, 5, 0, 1]);
GameData.ObjectArray.push(["Heart With Eye", 115, 5, 0, 1]);
GameData.ObjectArray.push(["Noose", 116, 5, 0, -3]);
GameData.ObjectArray.push(["School Desk", 117, 5, 0, 1]);
GameData.ObjectArray.push(["Lycoris Flower", 118, 5, 0, 2]);
GameData.ObjectArray.push(["Sariel's Staff", 119, 5, 0, 2]);
GameData.ObjectArray.push(["Arms (Extended 2)", 120, 5, 0, 2]);
GameData.ObjectArray.push(["Nightstick", 121, 5, 0, 2]);
GameData.ObjectArray.push(["Mini-Hakkero", 122, 5, 0, 4]);
GameData.ObjectArray.push(["Orange's Baton", 123, 5, 0, 4]);
GameData.ObjectArray.push(["Test Tube", 124, 5, 0, 4]);
GameData.ObjectArray.push(["Flandre", 125, 5, 0, 0]);
GameData.ObjectArray.push(["Prinny", 126, 5, 0, -1]);
GameData.ObjectArray.push(["Tank", 127, 5, 0, -2]);
GameData.ObjectArray.push(["Flower Tank", 128, 5, 0, -2]);
GameData.ObjectArray.push(["Utsuho's Orb", 129, 5, 0, 0]);
GameData.ObjectArray.push(["Arms (Upward)", 130, 5, 0, 0]);
GameData.ObjectArray.push(["Arms (Upward 2)", 131, 5, 0, 0]);
GameData.ObjectArray.push(["Third Leg", 132, 5, 0, 0]);
GameData.ObjectArray.push(["Train Car", 133, 5, 0, -5]);
GameData.ObjectArray.push(["Stained Glass", 134, 5, 0, 0]);
GameData.ObjectArray.push(["Window", 135, 5, 0, 0]);
GameData.ObjectArray.push(["Hands-to-Face ", 136, 5, 0, 0]);
GameData.ObjectArray.push(["Folding Screen", 137, 5, 0, -4]);
GameData.ObjectArray.push(["Dresser", 138, 5, 0, -2]);
GameData.ObjectArray.push(["Store Counter", 139, 5, 0, -4]);
GameData.ObjectArray.push(["Present", 140, 5, 0, 0]);
GameData.ObjectArray.push(["Truck-like Gift", 141, 5, 0, 0]);
GameData.ObjectArray.push(["Christmas Blade", 142, 5, 0, 0]);
GameData.ObjectArray.push(["NEET-hime Staff", 143, 5, 0, 0]);
GameData.ObjectArray.push(["Yukari's Tree", 144, 5, 0, -5]);
GameData.ObjectArray.push(["Alice's Tree", 145, 5, 0, -5]);
GameData.ObjectArray.push(["Mokou's Tree", 146, 5, 0, -5]);
GameData.ObjectArray.push(["Reimu's Tree", 147, 5, 0, -5]);
GameData.ObjectArray.push(["XMas Square", 148, 5, 0, -4]);
GameData.ObjectArray.push(["Elly's Scythe", 149, 5, 0, -3]);
GameData.ObjectArray.push(["Komachi's Scythe", 150, 5, 0, -3]);
GameData.ObjectArray.push(["Meira's Sword", 151, 2, 0, 0]);
GameData.ObjectArray.push(["Genji", 152, 5, 0, 0]);
GameData.ObjectArray.push(["Flying Eyeball", 153, 5, 0, 0]);
GameData.ObjectArray.push(["Konngara's Sword", 154, 2, 0, 0]);
GameData.ObjectArray.push(["Star Wand", 155, 5, 0, 0]);
GameData.ObjectArray.push(["Yuugen-Magan", 156, 5, 0, 0]);
GameData.ObjectArray.push(["Kikuri", 157, 5, 0, 0]);
GameData.ObjectArray.push(["Pink Pillow", 158, 5, 0, 0]);
GameData.ObjectArray.push(["Teacup+Plate", 159, 5, 0, 0]);
GameData.ObjectArray.push(["Yuka's Watch", 160, 5, 0, 0]);
GameData.ObjectArray.push(["Paper Umbrella", 161, 5, 0, 0]);
GameData.ObjectArray.push(["Smoke Pipe", 162, 5, 0, 0]);
GameData.ObjectArray.push(["Brick", 163, 5, 0, 0]);
GameData.ObjectArray.push(["Giant UFO", 164, 5, 0, 0]);
GameData.ObjectArray.push(["Kogasa's Umbrella", 165, 5, 10, -4]);
GameData.ObjectArray.push(["Unzan ", 166, 5, 0, 0]);
GameData.ObjectArray.push(["Unzan 2", 167, 5, 0, 0]);
GameData.ObjectArray.push(["Unzan Fist ", 168, 5, 0, 0]);
GameData.ObjectArray.push(["Unzan Fist 2", 169, 5, 0, 0]);
GameData.ObjectArray.push(["Red Cloud", 170, 5, 0, 0]);
GameData.ObjectArray.push(["Spring", 171, 5, 0, 0]);
GameData.ObjectArray.push(["Marisa's Wand", 172, 5, 0, 0]);
GameData.ObjectArray.push(["Boxing Chen", 173, 5, 0, 0]);
GameData.ObjectArray.push(["Teacup", 174, 5, 0, 0]);
GameData.ObjectArray.push(["Erhu", 175, 5, 0, 0]);
GameData.ObjectArray.push(["Erhu bow", 176, 5, 0, 0]);
GameData.ObjectArray.push(["Long sleeved", 177, 5, 0, 0]);
GameData.ObjectArray.push(["Short sleeved", 178, 5, 0, 0]);
GameData.ObjectArray.push(["Food Stand", 179, 5, 0, -5]);
GameData.ObjectArray.push(["Arrow", 180, 5, 0, 0]);
GameData.ObjectArray.push(["Morning Star", 181, 5, 0, 0]);
GameData.ObjectArray.push(["Gun", 182, 5, 0, 0]);
GameData.ObjectArray.push(["Halberd", 183, 5, 0, 0]);
GameData.ObjectArray.push(["Hands-to-Face 2", 184, 5, 0, 0]);
GameData.ObjectArray.push(["Frying Pan ", 185, 5, 0, 0]);
GameData.ObjectArray.push(["Frying Pan 2", 186, 5, 0, 0]);
GameData.ObjectArray.push(["Turtle Shell", 187, 5, 0, 0]);
GameData.ObjectArray.push(["Cat Ear (Black)", 188, 5, 0, 0]);
GameData.ObjectArray.push(["Cat Ear (Yellow)", 189, 5, 0, 0]);
GameData.ObjectArray.push(["Cat Ear (White)", 190, 5, 0, 0]);
GameData.ObjectArray.push(["Cat Tail (Black)", 191, 5, 0, 0]);
GameData.ObjectArray.push(["Cat Tail (Yellow)", 192, 5, 0, 0]);
GameData.ObjectArray.push(["Cat Tail (White)", 193, 5, 0, 0]);
GameData.ObjectArray.push(["Dio Sakuya ", 194, 5, 0, -3]);
GameData.ObjectArray.push(["Dio Sakuya 2", 195, 5, 0, -3]);
GameData.ObjectArray.push(["Book", 196, 5, 0, 0]);
GameData.ObjectArray.push(["Grimoire", 197, 5, 0, 0]);
GameData.ObjectArray.push(["Bookcase 1", 198, 5, 0, 0]);
GameData.ObjectArray.push(["Bookcase 2", 199, 5, 0, 0]);
GameData.ObjectArray.push(["Medicine Bottle", 200, 5, 0, 5]);
GameData.ObjectArray.push(["Beaker w/ liquid", 201, 5, 0, 5]);
GameData.ObjectArray.push(["Wireless Mouse", 202, 5, 0, 5]);
GameData.ObjectArray.push(["Hanging Hourai", 203, 5, 0, 0]);
GameData.ObjectArray.push(["Gondola (Outside)", 204, 5, 0, -4]);
GameData.ObjectArray.push(["Gondola (Inside)", 205, 5, 0, -4]);
GameData.ObjectArray.push(["Suwako's Hat", 206, 5, 0, 0]);
GameData.ObjectArray.push(["Reisen's Ear", 207, 5, 0, 5]);
GameData.ObjectArray.push(["Oar", 208, 5, 0, 3]);
GameData.ObjectArray.push(["Playing Card (Up)", 209, 5, 0, 5]);
GameData.ObjectArray.push(["Playing Card (Down)", 210, 5, 0, 3]);
GameData.ObjectArray.push(["Leaf (Orange)", 211, 5, 0, 5]);
GameData.ObjectArray.push(["Leaf (Green)", 212, 5, 0, 5]);
GameData.ObjectArray.push(["Tenshi's Rock 2", 213, 5, 0, 5]);
GameData.ObjectArray.push(["Pentagram", 214, 5, 0, 3]);
GameData.ObjectArray.push(["Butterfly", 215, 5, 0, 3]);
GameData.ObjectArray.push(["Bullet 08", 216, 5, 0, 3]);
GameData.ObjectArray.push(["Bullet 09", 217, 5, 0, 3]);
GameData.ObjectArray.push(["Anchor", 218, 5, 0, 0]);
GameData.ObjectArray.push(["Bullet (Anchor)", 219, 5, 0, 3]);
GameData.ObjectArray.push(["Dipper", 220, 5, 0, 3]);
GameData.ObjectArray.push(["Jeweled Pagoda", 221, 5, 0, 3]);
GameData.ObjectArray.push(["Spear", 222, 5, 0, 3]);
GameData.ObjectArray.push(["Rainbow Scroll", 223, 5, 0, -2]);
GameData.ObjectArray.push(["Catfish", 224, 5, 0, -5]);
GameData.ObjectArray.push(["Bullet 10", 225, 5, 0, 3]);
GameData.ObjectArray.push(["SukuHaku", 226, 5, 0, 3]);
GameData.ObjectArray.push(["Bullet 11", 227, 5, 0, 3]);
GameData.ObjectArray.push(["Star (Pink)", 228, 5, 0, 5]);
GameData.ObjectArray.push(["Star (Green)", 229, 5, 0, 5]);
GameData.ObjectArray.push(["Nue's Trident", 230, 5, 0, 5]);
GameData.ObjectArray.push(["Byakuren's Aura", 231, 5, 0, 2]);
GameData.ObjectArray.push(["Nue's Orb", 232, 5, 0, 5]);
GameData.ObjectArray.push(["UFO (Green)", 233, 5, 0, 5]);
GameData.ObjectArray.push(["UFO (Red)", 234, 5, 0, 5]);
GameData.ObjectArray.push(["UFO (Blue)", 235, 5, 0, 5]);
GameData.ObjectArray.push(["Bat", 236, 5, 0, 3]);
GameData.ObjectArray.push(["Pipe Organ", 237, 5, 0, -2]);
GameData.ObjectArray.push(["Green Tea", 238, 5, 0, 3]);
GameData.ObjectArray.push(["Onigiri", 239, 5, 0, 3]);
GameData.ObjectArray.push(["Empty Plate", 240, 5, 0, 3]);
GameData.ObjectArray.push(["Sushi", 241, 5, 0, 3]);
GameData.ObjectArray.push(["Mushroom", 242, 5, 0, 3]);
GameData.ObjectArray.push(["Low Table", 243, 5, 0, 3]);
GameData.ObjectArray.push(["Komachi's Scythe 2", 244, 5, 0, 2]);
GameData.ObjectArray.push(["Tori", 245, 5, 0, 3]);
GameData.ObjectArray.push(["Iku Dance Pose", 246, 5, 0, -1]);
GameData.ObjectArray.push(["Sakuya Throwing", 247, 5, 0, -1]);
GameData.ObjectArray.push(["Lightsaber", 248, 5, 0, 3]);
GameData.ObjectArray.push(["Flute", 249, 5, 0, 3]);
GameData.ObjectArray.push(["Cake", 250, 5, 0, 3]);
GameData.ObjectArray.push(["Coffin", 251, 5, 0, -3]);
GameData.ObjectArray.push(["Coffin Lid", 252, 5, 0, -3]);
GameData.ObjectArray.push(["Sunglasses", 253, 5, 0, 3]);
GameData.ObjectArray.push(["Power-Up!!", 254, 5, 0, -1]);
GameData.ObjectArray.push(["GAR shades", 255, 5, 0, 3]);
GameData.ObjectArray.push(["Hisoutensoku", 256, 5, 0, 0]);
GameData.ObjectArray.push(["Crow", 257, 5, 0, 3]);
GameData.ObjectArray.push(["PikaMarisa", 258, 5, 0, -1]);
GameData.ObjectArray.push(["Pumpkin (Carved)", 259, 5, 0, 3]);
GameData.ObjectArray.push(["Dog Collar+Leash", 260, 5, 0, 3]);
GameData.ObjectArray.push(["Wolf Ear", 261, 5, 0, 3]);
GameData.ObjectArray.push(["Candle", 262, 5, 0, 3]);
GameData.ObjectArray.push(["Mimi-chan", 263, 5, 0, 3]);
GameData.ObjectArray.push(["Hoshizako", 264, 5, 0, 3]);
GameData.ObjectArray.push(["Violin", 265, 5, 0, 3]);
GameData.ObjectArray.push(["Trumpet", 266, 5, 0, 3]);
GameData.ObjectArray.push(["Keyboard", 267, 5, 0, 3]);
GameData.ObjectArray.push(["Apple", 268, 5, 0, 6]);
GameData.ObjectArray.push(["Pad", 269, 5, 0, 3]);
GameData.ObjectArray.push(["Ice Cube", 270, 5, 0, 3]);
GameData.ObjectArray.push(["Byakuren Platform", 271, 5, 0, 3]);
GameData.ObjectArray.push(["Bullet (Needle)", 272, 5, 0, 3]);
GameData.ObjectArray.push(["Electric Guitar", 273, 5, 0, 3]);
GameData.ObjectArray.push(["Djembe", 274, 5, 0, 0]);
GameData.ObjectArray.push(["Drum stick", 275, 5, 0, 3]);
GameData.ObjectArray.push(["Chains of Fate", 276, 0, 0, 3]);
GameData.ObjectArray.push(["Bullet (Knife2)", 277, 5, 0, 3]);
GameData.ObjectArray.push(["Witch's Broom 2", 278, 5, 0, 1]);
GameData.ObjectArray.push(["Bullet (Music)", 279, 5, 0, 5]);
GameData.ObjectArray.push(["Bow", 280, 5, 0, 6]);
GameData.ObjectArray.push(["Staff (Sakuya's)", 281, 5, 0, 3]);
GameData.ObjectArray.push(["Star Orb", 282, 5, 0, 6]);
GameData.ObjectArray.push(["Bullet (Knife3)", 283, 5, 0, 3]);
GameData.ObjectArray.push(["Staff (Sanae's)", 284, 5, 0, 3]);
GameData.ObjectArray.push(["Bullet 12", 285, 5, 0, 3]);
GameData.ObjectArray.push(["EWI", 286, 5, 0, 3]);
GameData.ObjectArray.push(["Game Console", 287, 5, 0, 3]);
GameData.ObjectArray.push(["Game Controller", 288, 5, 0, 3]);
GameData.ObjectArray.push(["Book (Opened)", 289, 5, 0, 3]);
GameData.ObjectArray.push(["Ice Sword", 290, 5, 0, 3]);
GameData.ObjectArray.push(["Umbrella Closed", 291, 5, 0, 3]);
GameData.ObjectArray.push(["Chessboard", 292, 5, 0, 3]);
GameData.ObjectArray.push(["Hypnotic eyes", 293, 5, 0, 3]);
GameData.ObjectArray.push(["Suwako's Ring", 294, 5, 0, 3]);
GameData.ObjectArray.push(["Sword of some sort", 295, 5, 0, 3]);
GameData.ObjectArray.push(["Sanae's Stick", 296, 5, 0, 3]);
GameData.ObjectArray.push(["Drum Set", 297, 5, 0, -3]);
GameData.ObjectArray.push(["Giant Toad", 298, 5, 0, 3]);
GameData.ObjectArray.push(["Blue Frog", 299, 5, 0, 3]);
GameData.ObjectArray.push(["Blue Frog (Jumping)", 300, 5, 0, 3]);
GameData.ObjectArray.push(["CD", 301, 5, 0, 3]);
GameData.ObjectArray.push(["VHS Tape", 302, 5, 0, 3]);
GameData.ObjectArray.push(["Gas Mask", 303, 5, 0, 3]);
GameData.ObjectArray.push(["Apple Core", 304, 5, 0, 3]);
GameData.ObjectArray.push(["Bullet (Fantasy Orb)", 305, 5, 0, 3]);
GameData.ObjectArray.push(["Onbashira", 306, 5, 0, 3]);
GameData.ObjectArray.push(["MP3 Player", 307, 5, 0, 3]);
GameData.ObjectArray.push(["Cucumber", 308, 5, 0, 3]);
GameData.ObjectArray.push(["Rose", 309, 5, 0, 3]);
GameData.ObjectArray.push(["Rosebud", 310, 5, 0, 3]);
GameData.ObjectArray.push(["Throne", 311, 5, 0, 3]);
GameData.ObjectArray.push(["Cross", 312, 5, 0, 3]);
GameData.ObjectArray.push(["Shortsword", 313, 5, 0, 3]);
GameData.ObjectArray.push(["Two-Handed Sword", 314, 5, 0, 3]);
GameData.ObjectArray.push(["Shingyoku Orb", 315, 5, 0, 3]);
GameData.ObjectArray.push(["Duster", 316, 5, 0, 3]);
GameData.ObjectArray.push(["Miko Stick 2", 317, 5, 0, 3]);
GameData.ObjectArray.push(["Boot", 318, 5, 0, 3]);
GameData.ObjectArray.push(["Gap 2", 319, 5, 0, 3]);
GameData.ObjectArray.push(["Shadow", 320, 5, 0, 3]);
GameData.ObjectArray.push(["Cellphone", 321, 5, 0, 3]);
GameData.ObjectArray.push(["Youmu Sword 2A", 322, 5, 0, 3]);
GameData.ObjectArray.push(["Youmu Sword 2B", 323, 5, 0, 3]);
GameData.ObjectArray.push(["Skeleton", 324, 5, 0, 3]);
GameData.ObjectArray.push(["Shinki's Ahoge", 325, 5, 0, 3]);
GameData.ObjectArray.push(["Organs", 326, 5, 0, 3]);
GameData.ObjectArray.push(["Arm (Long sleeve)", 327, 5, 0, 3]);
GameData.ObjectArray.push(["Magic Stone", 328, 5, 0, 3]);
GameData.ObjectArray.push(["Soccer Ball", 329, 5, 0, 3]);
GameData.ObjectArray.push(["Archery Bow", 330, 5, 0, 3]);
GameData.ObjectArray.push(["Arm (Short sleeve)", 331, 5, 0, 3]);
GameData.ObjectArray.push(["Alpaca", 332, 5, 0, -3]);
GameData.ObjectArray.push(["Pizza", 333, 5, 0, 3]);
GameData.ObjectArray.push(["Pizza Slice", 334, 5, 0, 3]);
GameData.ObjectArray.push(["Banana", 335, 5, 0, 3]);
GameData.ObjectArray.push(["Bananas", 336, 5, 0, 3]);
GameData.ObjectArray.push(["Acoustic Guitar", 337, 5, 0, 3]);
GameData.ObjectArray.push(["Paper", 338, 5, 0, 3]);
GameData.ObjectArray.push(["Drill", 339, 5, 0, 3]);
GameData.ObjectArray.push(["Drill (Iku's)", 340, 5, 0, 3]);
GameData.ObjectArray.push(["Impossible Req 1", 341, 5, 0, 10]);
GameData.ObjectArray.push(["Impossible Req 2", 342, 5, 0, 10]);
GameData.ObjectArray.push(["Impossible Req 3", 343, 5, 0, 10]);
GameData.ObjectArray.push(["Impossible Req 4", 344, 5, 0, 10]);
GameData.ObjectArray.push(["Impossible Req 5", 345, 5, 0, 10]);
GameData.ObjectArray.push(["Turntable", 346, 5, 0, 3]);
GameData.ObjectArray.push(["Bone", 347, 5, 0, 13]);
GameData.ObjectArray.push(["Sweatdrop", 348, 5, 0, 3]);
GameData.ObjectArray.push(["Lightning Bolt", 349, 5, 0, 3]);
GameData.ObjectArray.push(["Box Car", 350, 5, 0, 3]);
GameData.ObjectArray.push(["Brain", 351, 5, 0, 3]);
GameData.ObjectArray.push(["Bubble 1", 352, 5, 0, 3]);
GameData.ObjectArray.push(["Bubble 2", 353, 5, 0, 3]);
GameData.ObjectArray.push(["Bubble action", 354, 5, 0, 3]);
GameData.ObjectArray.push(["Beer mug", 355, 5, 0, 10]);
GameData.ObjectArray.push(["Football", 356, 5, 0, 3]);
GameData.ObjectArray.push(["Basketball", 357, 5, 0, 13]);
GameData.ObjectArray.push(["Baseball", 358, 5, 0, 3]);
GameData.ObjectArray.push(["Baseball Bat", 359, 5, 0, 3]);
GameData.ObjectArray.push(["Book (Opened 2)", 360, 5, 0, 3]);
GameData.ObjectArray.push(["Radiator", 361, 5, 0, 3]);
GameData.ObjectArray.push(["Judge's Stand", 362, 5, 0, -5]);
GameData.ObjectArray.push(["Long Table", 363, 5, 0, -2]);
GameData.ObjectArray.push(["Eighth Note", 364, 5, 0, 3]);
GameData.ObjectArray.push(["Human Heart", 365, 5, 0, 3]);
GameData.ObjectArray.push(["Holy hand grenade", 366, 5, 0, 3]);
GameData.ObjectArray.push(["Arm (bent)", 367, 5, 0, 13]);
GameData.ObjectArray.push(["Arm (bent 2)", 368, 5, 0, 3]);
GameData.ObjectArray.push(["Cigarette", 369, 5, 0, 3]);
GameData.ObjectArray.push(["Cigar", 370, 5, 0, 3]);
GameData.ObjectArray.push(["Smoke fumes", 371, 5, 0, 3]);
GameData.ObjectArray.push(["Trophy", 372, 5, 0, -5]);
GameData.ObjectArray.push(["AK-47", 373, 5, 0, -2]);
GameData.ObjectArray.push(["Tissue box", 374, 5, 0, 3]);
GameData.ObjectArray.push(["Stones", 375, 5, 0, 3]);
GameData.ObjectArray.push(["Trees", 376, 5, 0, -5]);
GameData.ObjectArray.push(["Bottle ", 377, 5, 0, 5]);
GameData.ObjectArray.push(["Bottle 2", 378, 5, 0, 5]);
GameData.ObjectArray.push(["Cork", 379, 5, 0, 3]);
GameData.ObjectArray.push(["Kogasa's Umbrella 2", 380, 5, 0, -4]);
GameData.ObjectArray.push(["Blender", 381, 5, 0, 3]);
GameData.ObjectArray.push(["Comic Book", 382, 5, 0, 3]);
GameData.ObjectArray.push(["Comic Book Opened", 383, 5, 0, 3]);
GameData.ObjectArray.push(["Disco Ball", 384, 5, 0, 3]);
GameData.ObjectArray.push(["Motorcycle", 385, 5, 0, -2]);
GameData.ObjectArray.push(["Balloon", 386, 5, 0, 3]);
GameData.ObjectArray.push(["Rupee", 387, 5, 0, 3]);
GameData.ObjectArray.push(["Katamari Prince", 388, 5, 0, 3]);
GameData.ObjectArray.push(["Spellcard", 389, 5, 0, 5]);
GameData.ObjectArray.push(["Ping Pong Paddle", 390, 5, 0, 3]);
GameData.ObjectArray.push(["Ping Pong Ball", 391, 5, 0, 3]);
GameData.ObjectArray.push(["Kiseru", 392, 5, 0, 3]);
GameData.ObjectArray.push(["Tennis Net", 393, 5, 0, 0]);
GameData.ObjectArray.push(["Volleyball", 394, 5, 0, 5]);
GameData.ObjectArray.push(["Firefighter Axe", 395, 5, 0, 3]);
GameData.ObjectArray.push(["Ping Pong Table", 396, 5, 0, -4]);
GameData.ObjectArray.push(["Satellite Dish", 397, 5, 0, 3]);
GameData.ObjectArray.push(["Comic Book Opened 2", 398, 5, 0, 5]);
GameData.ObjectArray.push(["Couch", 399, 5, 0, -4]);
GameData.ObjectArray.push(["Soda Can", 400, 5, 0, 3]);
GameData.ObjectArray.push(["Pocky", 401, 5, 0, 3]);
GameData.ObjectArray.push(["Scooter", 402, 5, 0, 3]);
GameData.ObjectArray.push(["Grimoire 2", 403, 5, 0, 3]);
GameData.ObjectArray.push(["Whip", 404, 5, 0, 3]);
GameData.ObjectArray.push(["Machete", 405, 5, 0, 0]);
GameData.ObjectArray.push(["Yogurt in Cup", 406, 5, 0, 3]);
GameData.ObjectArray.push(["Aviator Shades", 407, 5, 0, 3]);
GameData.ObjectArray.push(["Dollar", 408, 5, 0, 5]);
GameData.ObjectArray.push(["Hatate's Phone", 409, 5, 0, 5]);
GameData.ObjectArray.push(["Scimitar", 410, 5, 0, 3]);
GameData.ObjectArray.push(["Skeleton Hand", 411, 5, 0, 0]);
GameData.ObjectArray.push(["Briefcase ", 412, 5, 0, 3]);
GameData.ObjectArray.push(["Briefcase 2", 413, 5, 0, 3]);
GameData.ObjectArray.push(["TV Set (Back)", 414, 4, 1, -6]);
GameData.ObjectArray.push(["Lotus", 415, 5, 0, 0]);
GameData.ObjectArray.push(["Lich Plush", 416, 5, 0, 3]);
GameData.ObjectArray.push(["Flandre Wing", 417, 5, 0, 3]);
GameData.ObjectArray.push(["Scarf", 418, 5, 0, 3]);
GameData.ObjectArray.push(["Raft", 419, 5, 0, 0]);
GameData.ObjectArray.push(["Piano", 420, 5, 0, -2]);
GameData.ObjectArray.push(["Paintbrush", 421, 5, 0, 3]);
GameData.ObjectArray.push(["Pie", 422, 5, 0, 0]);
GameData.ObjectArray.push(["Spiked Club", 423, 5, 0, 0]);
GameData.ObjectArray.push(["Syringe", 424, 5, 0, 3]);
GameData.ObjectArray.push(["Chainsaw", 425, 5, 0, 3]);
GameData.ObjectArray.push(["Sickle", 426, 5, 0, 3]);
GameData.ObjectArray.push(["Butterfly Knife", 427, 5, 0, 3]);
GameData.ObjectArray.push(["Revolver", 428, 5, 0, 3]);
GameData.ObjectArray.push(["Crystal", 429, 5, 0, 5]);
GameData.ObjectArray.push(["Wraith", 430, 5, 0, 2]);
GameData.ObjectArray.push(["Flaming Sword", 431, 5, 0, 3]);
GameData.ObjectArray.push(["Metal Fan", 432, 5, 0, 0]);
GameData.ObjectArray.push(["Umbrella 2", 433, 5, 0, 0]);
GameData.ObjectArray.push(["Umbrella Top", 434, 5, 0, 0]);
GameData.ObjectArray.push(["Umbrella Handle", 435, 5, 0, 0]);
GameData.ObjectArray.push(["Spartan Laser", 436, 5, 0, 3]);
GameData.ObjectArray.push(["Katamari", 437, 5, 0, 3]);
GameData.ObjectArray.push(["Lamp", 438, 5, 0, 3]);
GameData.ObjectArray.push(["Harp", 439, 5, 0, 0]);
GameData.ObjectArray.push(["Burger", 440, 5, 0, -2]);
GameData.ObjectArray.push(["Egg", 441, 5, 0, 3]);
GameData.ObjectArray.push(["Ghost", 442, 5, 0, 0]);
GameData.ObjectArray.push(["Lollipop", 443, 5, 0, 0]);
GameData.ObjectArray.push(["Slime", 444, 5, 0, 3]);
GameData.ObjectArray.push(["Sanae's Stick 2", 445, 5, 0, 3]);
GameData.ObjectArray.push(["Mirror (Small)", 446, 5, 0, 3]);
GameData.ObjectArray.push(["Mirror (Large)", 447, 5, 0, 3]);
GameData.ObjectArray.push(["Gears", 448, 5, 0, 3]);
GameData.ObjectArray.push(["Bunny Gun", 449, 5, 0, 0]);
GameData.ObjectArray.push(["Chair Folded", 450, 5, 0, -2]);
GameData.ObjectArray.push(["Cheese", 451, 5, 0, 3]);
GameData.ObjectArray.push(["Cookie", 452, 5, 0, 0]);
GameData.ObjectArray.push(["Lyre", 453, 5, 0, 0]);
GameData.ObjectArray.push(["Mishaguji-sama", 454, 5, 0, 3]);
GameData.ObjectArray.push(["Fish", 455, 5, 0, 3]);
GameData.ObjectArray.push(["Pumpkin", 456, 5, 0, 3]);
GameData.ObjectArray.push(["Fire (Blue)", 457, 5, 0, 3]);
GameData.ObjectArray.push(["Baby", 458, 5, 0, 3]);
GameData.ObjectArray.push(["Tennis Racquet", 459, 5, 0, 3]);
GameData.ObjectArray.push(["Doll (Marisa)", 460, 5, 0, -2]);
GameData.ObjectArray.push(["Doll (Alice)", 461, 5, 0, 3]);
GameData.ObjectArray.push(["Basket (woven)", 462, 5, 0, 0]);
GameData.ObjectArray.push(["Megaphone", 463, 5, 0, 0]);
GameData.ObjectArray.push(["Strawberry", 464, 5, 0, 3]);
GameData.ObjectArray.push(["Wine Glass", 465, 5, 0, 3]);
GameData.ObjectArray.push(["Black Line", 466, 5, 0, 3]);
GameData.ObjectArray.push(["Bamboo", 467, 5, 0, 3]);
GameData.ObjectArray.push(["Mouse", 468, 5, 0, 3]);
GameData.ObjectArray.push(["Speakers", 469, 5, 0, 3]);
GameData.ObjectArray.push(["Rubber Duck", 470, 5, 0, -2]);
GameData.ObjectArray.push(["Pokeball", 471, 5, 0, 3]);
GameData.ObjectArray.push(["Halo ", 472, 5, 0, 0]);
GameData.ObjectArray.push(["Halo (Zombie)", 473, 5, 0, 0]);
GameData.ObjectArray.push(["Carrot", 474, 5, 0, 3]);
GameData.ObjectArray.push(["Biscuit", 475, 5, 0, 3]);
GameData.ObjectArray.push(["Grenade ", 476, 5, 0, 3]);
GameData.ObjectArray.push(["Grenade pin", 477, 5, 0, 3]);
GameData.ObjectArray.push(["Cupcake", 478, 5, 0, 3]);
GameData.ObjectArray.push(["Cage", 479, 5, 0, 3]);
GameData.ObjectArray.push(["Stop Sign", 480, 5, 0, -2]);
GameData.ObjectArray.push(["Chocolate", 481, 5, 0, 3]);
GameData.ObjectArray.push(["Cello", 482, 5, 0, 0]);
GameData.ObjectArray.push(["Cello Bow", 483, 5, 0, 0]);
GameData.ObjectArray.push(["Bucket of Chicken", 484, 5, 0, 3]);
GameData.ObjectArray.push(["Ruler", 485, 5, 0, 3]);
GameData.ObjectArray.push(["Toothbrush", 486, 5, 0, 3]);
GameData.ObjectArray.push(["Bowling Ball", 487, 5, 0, 3]);
GameData.ObjectArray.push(["Bowling Pin", 488, 5, 0, 3]);
GameData.ObjectArray.push(["Boomerang", 489, 5, 0, 3]);
GameData.ObjectArray.push(["Eyepatch", 490, 5, 0, 3]);
GameData.ObjectArray.push(["Stealth Camo Device", 491, 5, 0, 3]);
GameData.ObjectArray.push(["Explosion", 492, 5, 0, 3]);
GameData.ObjectArray.push(["Grimoire Opened", 493, 5, 0, 3]);
GameData.ObjectArray.push(["Teacup (Suits)", 494, 5, 0, 3]);
GameData.ObjectArray.push(["Shiruken", 495, 5, 0, 3]);
GameData.ObjectArray.push(["Chains", 496, 5, 0, 3]);
GameData.ObjectArray.push(["Kitsune", 497, 5, 0, 3]);
GameData.ObjectArray.push(["Wolf", 498, 5, 0, 3]);
GameData.ObjectArray.push(["Saw", 499, 5, 0, 3]);
GameData.ObjectArray.push(["Dog", 500, 5, 0, 3]);
GameData.ObjectArray.push(["Popcorn Bag", 501, 5, 0, 3]);
GameData.ObjectArray.push(["Mr.Saturn", 502, 5, 0, 3]);
GameData.ObjectArray.push(["Katamari Kinoko", 503, 5, 0, 3]);
GameData.ObjectArray.push(["Tokin", 504, 5, 0, 3]);
GameData.ObjectArray.push(["Grimoire Opened 2", 505, 5, 0, 3]);
GameData.ObjectArray.push(["Marisa Hat", 506, 5, 0, 3]);
GameData.ObjectArray.push(["Sledgehammer", 507, 5, 0, 3]);
GameData.ObjectArray.push(["Hatchet", 508, 5, 0, 3]);
GameData.ObjectArray.push(["Cherry", 509, 5, 0, 3]);
GameData.ObjectArray.push(["Iku Dance Pose 2", 510, 5, 0, -1]);
GameData.ObjectArray.push(["Aviator Hat", 511, 5, 0, 3]);
GameData.ObjectArray.push(["Aviator Goggles", 512, 5, 0, 3]);
GameData.ObjectArray.push(["Viewfinder", 513, 5, 0, 3]);
GameData.ObjectArray.push(["Suika's Gourd 2", 514, 5, 0, 3]);
GameData.ObjectArray.push(["Handgun", 515, 5, 0, 3]);
GameData.ObjectArray.push(["Cat on Head 1", 516, 5, 0, 3]);
GameData.ObjectArray.push(["Cat on Head 2", 517, 5, 0, 3]);
GameData.ObjectArray.push(["Cat on Head 3", 518, 5, 0, 3]);
GameData.ObjectArray.push(["Yuka Baton", 519, 5, 0, 3]);
GameData.ObjectArray.push(["Meat", 520, 5, 0, -1]);
GameData.ObjectArray.push(["Bucket 2", 521, 5, 0, 3]);
GameData.ObjectArray.push(["Hairbrush", 522, 5, 0, 3]);
GameData.ObjectArray.push(["Microphone", 523, 5, 0, 3]);
GameData.ObjectArray.push(["Tie", 524, 5, 0, 3]);
GameData.ObjectArray.push(["Comb", 525, 5, 0, 3]);
GameData.ObjectArray.push(["Campfire", 526, 5, 0, 3]);
GameData.ObjectArray.push(["Bonfire", 527, 5, 0, 3]);
GameData.ObjectArray.push(["Knight Helm", 528, 5, 0, 3]);
GameData.ObjectArray.push(["Cat on Head 4", 529, 5, 0, 3]);
GameData.ObjectArray.push(["Mirror Midboss 1", 530, 5, 0, -3]);
GameData.ObjectArray.push(["Mirror Midboss 2", 531, 5, 0, -3]);
GameData.ObjectArray.push(["Sword in Dirt", 532, 5, 0, 3]);
GameData.ObjectArray.push(["Cowbell", 533, 5, 0, 3]);
GameData.ObjectArray.push(["Vuvuzela", 534, 5, 0, 3]);
GameData.ObjectArray.push(["Henohenomohejimake", 535, 5, 0, 3]);
GameData.ObjectArray.push(["Hotdog", 536, 5, 0, 3]);
GameData.ObjectArray.push(["Belt Eyeball Thing", 537, 5, 0, 3]);
GameData.ObjectArray.push(["Hypno Shroom", 538, 5, 0, 3]);
GameData.ObjectArray.push(["Bullet Orb", 539, 5, 0, 3]);
GameData.ObjectArray.push(["Motorcycle Helm", 540, 5, 0, 3]);
GameData.ObjectArray.push(["Skateboard", 541, 5, 0, -1]);
GameData.ObjectArray.push(["Cane", 542, 5, 0, -1]);
GameData.ObjectArray.push(["Muzzle", 543, 5, 0, -1]);
GameData.ObjectArray.push(["Energy Tank", 544, 5, 0, -1]);
GameData.ObjectArray.push(["Utsuho Wings", 545, 0, -1]);
GameData.ObjectArray.push(["Dog on Head 1", 546, 5, 0, -1]);
GameData.ObjectArray.push(["Dog on Head 2", 547, 5, 0, -1]);
GameData.ObjectArray.push(["Dog on Head 3", 548, 5, 0, -1]);
GameData.ObjectArray.push(["Chips", 549, 5, 0, -1]);
GameData.ObjectArray.push(["Frog", 550, 5, 0, -1]);
GameData.ObjectArray.push(["TARDIS", 551, 5, 0, -1]);
GameData.ObjectArray.push(["Mega Buster", 552, 5, 0, -1]);
GameData.ObjectArray.push(["Laptop", 553, 5, 0, -1]);
GameData.ObjectArray.push(["Bar Counter 2", 554, 5, 0, -5]);
GameData.ObjectArray.push(["Jukebox", 555, 5, 0, -1]);
GameData.ObjectArray.push(["Camcorder", 556, 5, 0, -1]);
GameData.ObjectArray.push(["Camcorder (Tripod)", 557, 5, 0, -1]);
GameData.ObjectArray.push(["Nail", 558, 5, 0, -3]);
GameData.ObjectArray.push(["Pom-pom", 559, 5, 0, -1]);
GameData.ObjectArray.push(["Bomb", 560, 5, 0, -1]);
GameData.ObjectArray.push(["Yorihime's Sword", 561, 5, 0, -1]);
GameData.ObjectArray.push(["Toyohime's Fan", 562, 5, 0, -1]);
GameData.ObjectArray.push(["Crocodile", 563, 5, 0, -1]);
GameData.ObjectArray.push(["Dalek", 564, 5, 0, -1]);
GameData.ObjectArray.push(["Shovel", 565, 5, 0, -5]);
GameData.ObjectArray.push(["Third Leg 2", 566, 5, 0, -1]);
GameData.ObjectArray.push(["Popsicle", 567, 5, 0, -1]);
GameData.ObjectArray.push(["Wristwatch", 568, 5, 0, -1]);
GameData.ObjectArray.push(["Peach", 569, 5, 0, 0]);
GameData.ObjectArray.push(["Arcade Cabinet", 570, 5, 0, -6]);
GameData.ObjectArray.push(["White Scar", 571, 5, 0, 0]);
GameData.ObjectArray.push(["Bottle (Drink)", 572, 5, 0, 0]);
GameData.ObjectArray.push(["Bullet (Sword)", 573, 5, 0, 0]);
GameData.ObjectArray.push(["Cow", 574, 5, 0, 0]);
GameData.ObjectArray.push(["Hammock", 575, 5, 0, 0]);
GameData.ObjectArray.push(["Hedgehog", 576, 5, 0, 0]);
GameData.ObjectArray.push(["Orangey Orb", 577, 5, 0, 0]);
GameData.ObjectArray.push(["Staff", 578, 5, 0, 0]);
GameData.ObjectArray.push(["Shutter Shades", 579, 5, 0, 0]);
GameData.ObjectArray.push(["Rainbow", 580, 5, 0, 0]);
GameData.ObjectArray.push(["Gachapon Container", 581, 5, 0, 0]);
GameData.ObjectArray.push(["Kappa", 582, 5, 0, 0]);
GameData.ObjectArray.push(["Road Sign", 583, 5, 0, 0]);
GameData.ObjectArray.push(["Judgement Stick", 584, 5, 0, 0]);
GameData.ObjectArray.push(["Hammer", 585, 5, 0, 0]);
GameData.ObjectArray.push(["Cherry Blossom", 586, 5, 0, 0]);
GameData.ObjectArray.push(["Laptop Back", 587, 5, 0, 0]);
GameData.ObjectArray.push(["Durian", 588, 5, 0, 0]);
GameData.ObjectArray.push(["Orb", 589, 5, 0, 0]);
GameData.ObjectArray.push(["Ittan Momen", 590, 5, 0, 0]);
GameData.ObjectArray.push(["Taco", 591, 5, 0, 0]);
GameData.ObjectArray.push(["Burrito", 592, 5, 0, 0]);
GameData.ObjectArray.push(["Luggage", 593, 5, 0, 0]);
GameData.ObjectArray.push(["MokoSheep", 594, 5, 0, 0]);
GameData.ObjectArray.push(["Andon Lamp", 595, 5, 0, 0]);
GameData.ObjectArray.push(["Cast", 596, 5, 0, 0]);
GameData.ObjectArray.push(["Shopping Cart", 597, 5, 0, 0]);
GameData.ObjectArray.push(["Mushroom-Stick", 598, 5, 0, 0]);
GameData.ObjectArray.push(["Top Hat", 599, 5, 0, 0]);
GameData.ObjectArray.push(["Yellow Glow", 600, 5, 0, 0]);
GameData.ObjectArray.push(["Hrtp Tiles", 601, 5, 0, 0]);
GameData.ObjectArray.push(["Boombox", 602, 5, 0, 0]);
GameData.ObjectArray.push(["Revolver Blade", 603, 5, 0, 0]);
GameData.ObjectArray.push(["Underpants", 604, 5, 0, 0]);
GameData.ObjectArray.push(["Treasure Chest", 605, 5, 0, 0]);
GameData.ObjectArray.push(["Tornado", 606, 5, 0, 0]);
GameData.ObjectArray.push(["YinYang Headphones", 607, 5, 0, 0]);
GameData.ObjectArray.push(["Ran's Tail", 608, 5, 0, 0]);
GameData.ObjectArray.push(["Noby Noby", 609, 5, 0, 0]);
GameData.ObjectArray.push(["Door", 610, 5, 0, 0]);
GameData.ObjectArray.push(["Utsuho Eye", 611, 5, 0, 0]);
GameData.ObjectArray.push(["Spray Bottle", 612, 5, 0, 0]);
GameData.ObjectArray.push(["Water Spray", 613, 5, 0, 0]);
GameData.ObjectArray.push(["Spraypaint Can", 614, 5, 0, 0]);
GameData.ObjectArray.push(["Marisa (NWTI)", 615, 5, 0, 0]);
GameData.ObjectArray.push(["Dust Cloud", 616, 5, 0, 0]);
GameData.ObjectArray.push(["Spray", 617, 5, 0, 3]);
GameData.ObjectArray.push(["Spoon", 618, 5, 0, 3]);
GameData.ObjectArray.push(["Bowl", 619, 5, 0, 3]);
GameData.ObjectArray.push(["Balloon (Stringless)", 620, 5, 0, 3]);
GameData.ObjectArray.push(["Laptop Closed", 621, 5, 0, 3]);
GameData.ObjectArray.push(["Tengu Mask", 622, 5, 0, 3]);
GameData.ObjectArray.push(["Arm (Yoshika)", 623, 5, 0, 3]);
GameData.ObjectArray.push(["Seal (Yoshika)", 624, 5, 0, 3]);
GameData.ObjectArray.push(["Seiga Cloth", 625, 5, 0, 3]);
GameData.ObjectArray.push(["Miko's Sword", 626, 5, 0, 3]);
GameData.ObjectArray.push(["Miko's Shaku", 627, 5, 0, 3]);
GameData.ObjectArray.push(["Leaf (Mamizou)", 628, 5, 0, 3]);
GameData.ObjectArray.push(["Notepad (Mamizou)", 629, 5, 0, 3]);
GameData.ObjectArray.push(["Bottle (Mamizou)", 630, 5, 0, 3]);
GameData.ObjectArray.push(["Stone Lantern", 631, 5, 0, 20]);
GameData.ObjectArray.push(["Bullet 13", 632, 5, 0, 20]);
GameData.ObjectArray.push(["Divine Spirit", 633, 5, 0, 10]);
newPreset("Meiling", 1, 0, 0, 0, 1, 1, 1, 0, 0, 0);
newPreset("Reimu", 2, 0, 0, 1, 2, 2, 2, 1, 0, 0);
newPreset("Marisa", 3, 0, 0, 2, 3, 3, 3, 2, 0, 0);
newPreset("Sakuya", 4, 0, 0, 3, 4, 4, 4, 3, 0, 0);
newPreset("Yukari", 5, 0, 0, 4, 5, 5, 5, 4, 27, 0);
newPreset("Flandre", 6, 0, 1, 5, 6, 6, 6, 5, 1, 0);
newPreset("Yuyuko", 7, 0, 0, 6, 7, 7, 7, 27, 28, 0);
newPreset("Kaguya", 8, 0, 0, 7, 0, 8, 8, 0, 0, 0);
newPreset("Cirno", 9, 0, 1, 8, 9, 9, 9, 0, 2, 0);
newPreset("Eirin", 10, 0, 0, 9, 10, 10, 10, 0, 0, 0);
newPreset("Ran", 19, 0, 0, 18, 19, 19, 19, 0, 9, 0);
newPreset("Chen", 21, 6, 4, 20, 21, 21, 21, 0, 10, 0);
newPreset("Momizi", 32, 0, 0, 31, 32, 32, 32, 48, 16, 37);
newPreset("Youmu", 11, 0, 11, 10, 11, 11, 11, 10, 0, 0);
newPreset("Patchouli", 12, 0, 0, 11, 12, 12, 12, 11, 0, 0);
newPreset("Alice", 13, 0, 0, 12, 13, 13, 13, 12, 0, 0);
newPreset("Reisen", 14, 0, 0, 13, 14, 14, 14, 0, 51, 0);
newPreset("Mokou", 15, 0, 0, 14, 15, 15, 15, 0, 7, 0);
newPreset("Mystia", 16, 0, 0, 15, 16, 16, 16, 0, 4, 0);
newPreset("Tewi", 17, 0, 0, 16, 17, 17, 17, 0, 51, 0);
newPreset("Keine", 18, 0, 0, 17, 18, 18, 18, 0, 0, 0);
newPreset("Letty", 20, 0, 0, 19, 20, 20, 20, 0, 0, 63);
newPreset("Suika", 22, 31, 13, 21, 22, 22, 22, 36, 0, 0);
newPreset("Remilia", 23, 0, 0, 22, 23, 23, 23, 39, 11, 0);
newPreset("Lily White", 24, 0, 0, 23, 24, 24, 24, 0, 12, 0);
newPreset("Lily Black", 25, 0, 0, 24, 25, 25, 25, 0, 12, 0);
newPreset("Komachi", 26, 40, 22, 25, 26, 26, 26, 41, 0, 0);
newPreset("Nitori", 27, 0, 0, 26, 27, 27, 27, 42, 13, 0);
newPreset("Sikieiki", 28, 0, 0, 27, 28, 28, 28, 43, 0, 0);
newPreset("Wriggle", 29, 0, 0, 28, 29, 29, 29, 0, 14, 0);
newPreset("Rumia", 30, 0, 0, 29, 30, 30, 30, 0, 0, 33);
newPreset("Aya", 31, 0, 0, 30, 31, 31, 31, 47, 15, 36);
newPreset("Koakuma", 33, 0, 0, 32, 33, 33, 33, 0, 17, 0);
newPreset("Lunasa", 34, 0, 0, 33, 34, 34, 34, 50, 0, 0);
newPreset("Lyrica", 36, 0, 0, 35, 36, 36, 36, 52, 0, 0);
newPreset("Merlin", 35, 0, 0, 34, 35, 35, 35, 51, 0, 0);
newPreset("Daiyousei", 37, 0, 0, 36, 37, 37, 37, 0, 18, 0);
newPreset("Medicine", 38, 0, 0, 37, 38, 38, 38, 0, 0, 40);
newPreset("Keine (EX)", 39, 0, 0, 38, 39, 39, 39, 0, 19, 0);
newPreset("Yuka", 40, 0, 0, 39, 0, 40, 40, 57, 0, 0);
newPreset("Suwako", 41, 0, 0, 40, 41, 41, 41, 0, 0, 0);
newPreset("Hina", 42, 0, 0, 41, 42, 42, 42, 0, 0, 0);
newPreset("Sanae", 43, 0, 0, 42, 43, 43, 43, 74, 0, 0);
newPreset("Kanako", 44, 0, 0, 43, 44, 44, 44, 0, 20, 0);
newPreset("Minoriko", 45, 0, 0, 44, 45, 45, 45, 0, 0, 0);
newPreset("Shizuha", 46, 0, 0, 45, 46, 46, 46, 0, 0, 0);
newPreset("Shinki", 47, 0, 0, 46, 47, 47, 47, 0, 21, 0);
newPreset("Mima", 48, 0, 0, 47, 48, 48, 98, 0, 0, 0);
newPreset("Rinnosuke", 49, 0, 0, 48, 0, 49, 49, 0, 0, 1);
newPreset("Tokiko", 50, 0, 0, 49, 50, 50, 50, 0, 22, 0);
newPreset("Sunny Milk", 51, 0, 0, 50, 51, 51, 51, 0, 23, 0);
newPreset("Star Sapphire", 52, 0, 0, 51, 52, 52, 52, 0, 24, 0);
newPreset("Luna Child", 53, 0, 0, 52, 53, 53, 53, 0, 25, 0);
newPreset("Akyu", 54, 0, 0, 53, 54, 54, 54, 69, 0, 0);
newPreset("Renko", 55, 0, 0, 54, 55, 55, 55, 0, 0, 0);
newPreset("Maribel", 56, 0, 0, 55, 56, 56, 56, 0, 0, 0);
newPreset("Chiyuri", 57, 0, 0, 56, 57, 57, 57, 0, 0, 0);
newPreset("Yumemi", 58, 0, 0, 57, 0, 58, 58, 0, 0, 0);
newPreset("Reimu (PC-98)", 59, 0, 0, 58, 59, 59, 59, 0, 0, 0);
newPreset("Tenshi", 61, 0, 0, 60, 61, 61, 61, 0, 0, 0);
newPreset("Iku", 62, 0, 0, 61, 62, 62, 62, 0, 32, 0);
newPreset("Yamame", 60, 0, 0, 59, 60, 60, 60, 0, 30, 0);
newPreset("Yuugi", 63, 0, 0, 62, 63, 63, 63, 81, 0, 0);
newPreset("Kisume", 64, 0, 0, 63, 64, 0, 0, 0, 0, 0);
newPreset("Parsee", 65, 0, 0, 64, 0, 64, 64, 0, 0, 0);
newPreset("Yorihime", 66, 0, 0, 65, 66, 65, 65, 0, 0, 0);
newPreset("Toyohime", 67, 0, 0, 66, 67, 66, 66, 0, 0, 0);
newPreset("Marisa (PC-98)", 68, 0, 0, 67, 68, 67, 67, 0, 0, 0);
newPreset("Youki", 69, 0, 0, 68, 0, 68, 68, 0, 0, 59);
newPreset("Alice (PC-98)", 70, 0, 0, 69, 70, 69, 69, 0, 0, 0);
newPreset("Kurumi", 71, 0, 0, 70, 71, 70, 70, 0, 33, 0);
newPreset("Luize", 72, 31, 39, 71, 72, 71, 71, 0, 0, 0);
newPreset("Utsuho", 73, 0, 0, 72, 73, 72, 72, 0, 34, 0);
newPreset("Orin", 74, 0, 0, 73, 74, 73, 73, 0, 35, 0);
newPreset("Satori", 75, 73, 40, 74, 75, 74, 74, 0, 0, 61);
newPreset("Koishi", 76, 0, 23, 75, 76, 75, 75, 0, 36, 66);
newPreset("Yumeko", 77, 0, 0, 76, 77, 76, 76, 3, 0, 0);
newPreset("Ruukoto", 78, 31, 11, 77, 78, 77, 77, 0, 0, 0);
newPreset("Mugetsu", 79, 0, 0, 78, 79, 78, 78, 0, 0, 0);
newPreset("VIVIT", 80, 0, 0, 79, 80, 79, 79, 0, 0, 0);
newPreset("Gengetsu", 81, 0, 0, 80, 81, 80, 80, 0, 37, 0);
newPreset("Sariel", 82, 0, 0, 81, 0, 81, 81, 82, 38, 0);
newPreset("Konngara", 83, 0, 0, 82, 83, 82, 82, 83, 0, 0);
newPreset("Kotohime", 84, 0, 0, 83, 0, 83, 83, 0, 0, 0);
newPreset("Orange", 85, 0, 0, 84, 85, 84, 84, 86, 0, 0);
newPreset("Rikako", 86, 0, 0, 85, 86, 85, 85, 87, 0, 64);
newPreset("Rika", 87, 0, 0, 86, 87, 86, 86, 42, 31, 0);
newPreset("Yuki", 88, 0, 0, 87, 88, 87, 87, 0, 0, 0);
newPreset("Mai", 89, 0, 0, 88, 89, 88, 88, 0, 39, 0);
newPreset("Ellen", 90, 0, 0, 89, 90, 89, 89, 0, 0, 0);
newPreset("Kana", 91, 0, 0, 90, 91, 90, 90, 0, 0, 0);
newPreset("Elly", 92, 0, 0, 91, 92, 91, 91, 0, 0, 0);
newPreset("Sara", 93, 0, 0, 92, 0, 92, 92, 0, 0, 0);
newPreset("Meira", 94, 0, 0, 93, 94, 93, 93, 90, 0, 0);
newPreset("Elis", 95, 0, 0, 94, 95, 94, 94, 91, 41, 65);
newPreset("Shingyoku F", 96, 0, 0, 95, 96, 95, 95, 0, 0, 0);
newPreset("Shingyoku M", 97, 0, 0, 96, 97, 96, 96, 0, 0, 0);
newPreset("Yuka (PJ's)", 98, 0, 0, 97, 98, 97, 97, 0, 0, 0);
newPreset("Yukari (PCB)", 99, 0, 0, 98, 99, 98, 5, 0, 0, 0);
newPreset("Marisa (SA)", 100, 0, 11, 99, 100, 99, 99, 0, 0, 0);
newPreset("Reisen (SWR)", 101, 0, 0, 126, 14, 100, 100, 0, 51, 0);
newPreset("Reisen II", 126, 0, 0, 100, 101, 14, 14, 0, 51, 0);
newPreset("Nazrin", 102, 0, 11, 101, 102, 101, 101, 93, 43, 0);
newPreset("Kogasa", 103, 81, 0, 102, 0, 102, 102, 94, 0, 0);
newPreset("Ichirin", 104, 0, 0, 103, 104, 103, 103, 95, 0, 0);
newPreset("Marisa (UFO)", 105, 0, 11, 104, 105, 104, 104, 96, 0, 0);
newPreset("Zombie Fairy", 106, 85, 0, 105, 106, 105, 105, 0, 44, 0);
newPreset("Shanghai", 107, 0, 0, 106, 107, 106, 106, 0, 23, 0);
newPreset("Rin Satsuki", 108, 0, 11, 107, 59, 107, 107, 97, 0, 68);
newPreset("Layla", 109, 31, 11, 108, 0, 108, 108, 0, 0, 0);
newPreset("Meimu", 110, 0, 0, 109, 109, 109, 109, 0, 0, 0);
newPreset("Meiling (2)", 111, 0, 0, 110, 110, 209, 1, 0, 0, 0);
newPreset("Lie Meiling", 112, 0, 0, 111, 111, 209, 5, 0, 0, 0);
newPreset("Reimu (2 Blue)", 113, 0, 0, 112, 112, 111, 2, 0, 0, 0);
newPreset("Marisa (PCB)", 114, 0, 11, 113, 113, 99, 3, 0, 0, 0);
newPreset("Sakuya (2)", 115, 0, 0, 114, 114, 89, 90, 0, 0, 0);
newPreset("Yukari (IaMP)", 116, 0, 11, 115, 99, 112, 5, 0, 0, 0);
newPreset("Flandre (2)", 117, 0, 51, 116, 115, 113, 6, 0, 45, 0);
newPreset("Yuyuko (2)", 118, 0, 11, 117, 116, 114, 9, 0, 0, 0);
newPreset("Kaguya (2)", 119, 0, 0, 118, 0, 115, 8, 0, 0, 0);
newPreset("Cirno (2A)", 120, 0, 51, 119, 117, 3, 9, 0, 47, 0);
newPreset("Cirno (2B)", 120, 0, 51, 120, 117, 3, 9, 0, 47, 0);
newPreset("Eirin (2)", 121, 0, 0, 121, 121, 116, 10, 0, 0, 0);
newPreset("Youmu (2)", 122, 0, 0, 122, 123, 117, 3, 0, 0, 0);
newPreset("Patchouli (2)", 123, 0, 0, 123, 124, 118, 12, 0, 0, 0);
newPreset("Alice (2A)", 124, 0, 0, 124, 125, 119, 13, 0, 0, 0);
newPreset("Alice (2B)", 125, 0, 0, 125, 125, 119, 13, 0, 0, 0);
newPreset("Reisen (2)", 126, 0, 0, 126, 126, 120, 14, 0, 51, 0);
newPreset("Mokou (2)", 127, 0, 0, 127, 127, 121, 15, 0, 48, 0);
newPreset("Mystia (2A)", 128, 0, 0, 128, 128, 122, 16, 0, 50, 0);
newPreset("Mystia (2B)", 129, 31, 11, 128, 129, 123, 16, 0, 49, 0);
newPreset("Tewi (2)", 130, 0, 51, 129, 130, 124, 17, 0, 51, 73);
newPreset("Keine (2)", 131, 0, 0, 130, 131, 117, 18, 0, 0, 0);
newPreset("Keine (EX2)", 132, 0, 0, 131, 132, 117, 39, 0, 52, 0);
newPreset("Ran (2)", 133, 0, 0, 132, 133, 125, 19, 0, 53, 0);
newPreset("Letty (2)", 134, 0, 11, 133, 134, 126, 20, 0, 54, 0);
newPreset("Chen (2)", 135, 26, 13, 134, 135, 127, 21, 0, 55, 0);
newPreset("Suika (2)", 136, 23, 8, 135, 136, 128, 22, 0, 0, 0);
newPreset("Murasa", 137, 0, 0, 136, 137, 129, 14, 100, 56, 0);
newPreset("Shou", 138, 0, 11, 137, 138, 130, 14, 101, 57, 0);
newPreset("Byakuren", 139, 0, 0, 138, 0, 131, 14, 0, 62, 0);
newPreset("Nue", 140, 0, 0, 139, 0, 135, 14, 104, 58, 0);
newPreset("Remilia (2)", 141, 0, 0, 140, 139, 136, 23, 0, 59, 0);
newPreset("Lily White (2)", 142, 0, 0, 141, 140, 137, 24, 0, 60, 0);
newPreset("Lily Black (2)", 143, 0, 0, 142, 141, 138, 25, 0, 60, 0);
newPreset("Komachi (2)", 144, 40, 22, 143, 142, 139, 26, 0, 0, 0);
newPreset("Nitori (2)", 145, 0, 0, 144, 143, 140, 27, 0, 61, 0);
newPreset("Reimu (2 Brown)", 113, 0, 0, 145, 112, 111, 2, 0, 0, 0);
newPreset("Sikieiki (2)", 147, 0, 0, 146, 144, 141, 28, 0, 0, 0);
newPreset("Wriggle (2)", 148, 0, 0, 148, 145, 126, 29, 0, 63, 0);
newPreset("Rumia (2)", 149, 31, 13, 149, 146, 143, 30, 0, 0, 33);
newPreset("Aya (2A)", 150, 0, 0, 150, 147, 145, 31, 0, 0, 0);
newPreset("Aya (2B)", 151, 0, 0, 150, 148, 145, 31, 0, 0, 0);
newPreset("Momizi (2)", 152, 0, 0, 151, 149, 146, 32, 108, 65, 0);
newPreset("Koakuma (2)", 153, 0, 0, 152, 150, 147, 33, 0, 66, 0);
newPreset("Marisa (2)", 154, 0, 0, 153, 151, 117, 3, 0, 0, 0);
newPreset("Lunasa (2)", 155, 0, 0, 154, 152, 148, 34, 0, 0, 0);
newPreset("Merlin (2)", 156, 0, 0, 155, 153, 149, 35, 0, 0, 0);
newPreset("Lyrica (2)", 157, 0, 0, 156, 154, 150, 36, 0, 0, 0);
newPreset("Sakuya (Magical)", 158, 0, 0, 114, 114, 151, 111, 0, 0, 0);
newPreset("Sanae (Magical)", 159, 0, 0, 162, 155, 157, 43, 111, 0, 0);
newPreset("Daiyousei (2)", 160, 0, 0, 157, 156, 152, 37, 0, 70, 0);
newPreset("Medicine (2)", 162, 0, 0, 158, 157, 153, 38, 0, 71, 40);
newPreset("Yuka (2)", 163, 0, 0, 159, 0, 142, 40, 0, 0, 0);
newPreset("Suwako (2)", 165, 0, 0, 160, 159, 155, 41, 0, 0, 0);
newPreset("Hina (2A)", 166, 0, 0, 161, 160, 156, 42, 0, 0, 0);
newPreset("Sanae (2)", 167, 0, 0, 162, 161, 157, 43, 0, 0, 0);
newPreset("Kanako (2)", 168, 0, 0, 163, 163, 158, 44, 0, 73, 0);
newPreset("Hina (2B)", 166, 0, 0, 161, 164, 156, 42, 0, 0, 0);
newPreset("Minoriko (2)", 169, 0, 0, 165, 167, 159, 45, 0, 0, 0);
newPreset("Sakuya (Inu)", 115, 0, 0, 114, 168, 89, 90, 0, 0, 0);
newPreset("Shizuha (2)", 170, 0, 0, 166, 169, 160, 46, 0, 0, 0);
newPreset("Shinki (2)", 171, 0, 0, 167, 171, 161, 47, 0, 78, 0);
newPreset("Mima (2)", 172, 0, 0, 168, 174, 163, 98, 0, 0, 0);
newPreset("Rinnosuke (2)", 173, 0, 0, 170, 0, 164, 49, 0, 0, 64);
newPreset("Rengeteki", 176, 0, 0, 172, 181, 166, 68, 0, 82, 0);
newPreset("Tokiko (2)", 179, 0, 0, 173, 188, 169, 50, 0, 83, 0);
newPreset("Sunny Milk (2)", 181, 0, 0, 174, 189, 172, 51, 0, 85, 0);
newPreset("Star Sapphire (2A)", 182, 0, 0, 175, 195, 173, 52, 0, 86, 0);
newPreset("Star Sapphire (2B)", 182, 0, 0, 176, 195, 173, 52, 0, 86, 0);
newPreset("Hatate", 184, 0, 0, 177, 199, 174, 31, 0, 0, 0);
newPreset("Luna Child (2)", 185, 0, 0, 178, 200, 175, 53, 0, 92, 0);
newPreset("Reimu (EoSD)", 186, 0, 0, 169, 112, 111, 2, 0, 0, 0);
newPreset("Reimu (PCB)", 187, 0, 0, 169, 112, 111, 2, 0, 0, 0);
newPreset("Reimu (PoFV)", 188, 0, 0, 145, 112, 111, 2, 0, 0, 0);
newPreset("Reimu (SA)", 189, 0, 0, 169, 112, 111, 2, 0, 0, 0);
newPreset("Akyu (2)", 194, 0, 0, 179, 208, 176, 54, 0, 0, 0);
newPreset("Renko (2)", 196, 0, 0, 181, 210, 175, 55, 0, 0, 0);
newPreset("Maribel (2)", 198, 0, 0, 183, 211, 178, 56, 0, 0, 0);
newPreset("Yamame (2)", 202, 0, 0, 185, 215, 182, 60, 0, 0, 0);
newPreset("Chiyuri (2)", 203, 0, 0, 186, 216, 183, 57, 0, 0, 0);
newPreset("Cirno (Fire)", 213, 0, 51, 189, 223, 3, 6, 0, 100, 0);
newPreset("Yumemi (2)", 205, 0, 0, 187, 0, 184, 58, 0, 96, 0);
newPreset("Reimu (PC-98 2)", 217, 0, 0, 190, 229, 189, 59, 0, 0, 0);
newPreset("Tenshi (2A)", 224, 0, 0, 196, 236, 192, 61, 0, 0, 0);
newPreset("Tenshi (2B)", 224, 0, 0, 202, 236, 192, 61, 0, 0, 0);
newPreset("Mima (HRtP)", 175, 0, 0, 168, 246, 163, 98, 0, 0, 0);
newPreset("Iku (2)", 226, 0, 0, 201, 244, 195, 62, 0, 105, 0);
newPreset("Yuugi (2)", 232, 0, 0, 204, 250, 197, 63, 0, 0, 0);
newPreset("Kisume (2A)", 233, 0, 0, 205, 64, 0, 0, 0, 106, 0);
newPreset("Kisume (2B)", 233, 0, 0, 206, 64, 0, 0, 0, 106, 0);
newPreset("Parsee (2)", 237, 0, 0, 207, 0, 200, 64, 0, 0, 0);
newPreset("Utsuho (2)", 240, 0, 0, 208, 256, 201, 115, 0, 110, 0);
newPreset("Orin (2)", 244, 0, 0, 209, 258, 203, 73, 0, 111, 0);
newPreset("Reimu (PC-98 2 Green)", 264, 0, 0, 190, 268, 213, 39, 0, 0, 0);
newPreset("Satori (2A)", 262, 0, 0, 210, 265, 210, 74, 0, 0, 0);
newPreset("Satori (2B)", 263, 0, 0, 210, 265, 210, 74, 0, 0, 122);
newPreset("Koishi (2A)", 266, 0, 0, 212, 270, 214, 75, 0, 0, 0);
newPreset("Koishi (2B)", 267, 0, 0, 212, 270, 214, 75, 0, 0, 125);
newPreset("Kasen", 272, 0, 0, 214, 273, 215, 58, 0, 0, 0);
newPreset("Mitori", 280, 0, 0, 216, 277, 218, 6, 151, 114, 0);
newPreset("Sasha", 281, 0, 0, 217, 0, 222, 102, 0, 0, 0);
newPreset("Yorihime (2)", 287, 0, 0, 219, 284, 224, 65, 143, 0, 0);
newPreset("Toyohime (2)", 288, 0, 0, 220, 285, 226, 66, 144, 0, 0);
newPreset("Youki (2)", 289, 0, 0, 221, 0, 227, 68, 0, 0, 138);
newPreset("Alice (PC-98)(2)", 290, 0, 0, 222, 286, 228, 69, 0, 0, 0);
newPreset("Kurumi (2)", 291, 0, 0, 223, 287, 229, 70, 0, 118, 0);
newPreset("Marisa (PC-98)(2)", 292, 0, 0, 224, 288, 230, 67, 0, 0, 0);
newPreset("Luize (2A)", 293, 0, 0, 225, 289, 231, 71, 0, 0, 0);
newPreset("Luize (2B)", 294, 0, 0, 225, 289, 231, 71, 0, 0, 0);
newPreset("Yumeko (2)", 295, 0, 0, 226, 290, 232, 76, 0, 0, 0);
newPreset("Ruukoto (2)", 296, 0, 0, 227, 291, 233, 77, 0, 0, 0);
newPreset("Mugetsu (2)", 298, 0, 0, 229, 293, 234, 78, 0, 0, 0);
newPreset("Gengetsu (2)", 299, 0, 0, 230, 294, 235, 80, 0, 119, 0);
newPreset("Sariel (2A)", 300, 0, 0, 231, 0, 236, 81, 82, 120, 0);
newPreset("Sariel (2B)", 300, 0, 0, 232, 0, 236, 81, 82, 120, 0);
newPreset("Konngara (2A)", 301, 0, 0, 233, 295, 130, 82, 83, 0, 0);
newPreset("Konngara (2B)", 301, 0, 0, 234, 295, 130, 82, 83, 0, 0);
newPreset("Kotohime (2)", 303, 0, 0, 236, 0, 237, 83, 0, 0, 0);
newPreset("Orange (2A)", 304, 0, 0, 237, 299, 238, 84, 86, 0, 0);
newPreset("Orange (2B)", 304, 0, 0, 238, 299, 238, 84, 86, 0, 0);
newPreset("Rikako (2A)", 305, 0, 0, 239, 300, 239, 85, 0, 0, 139);
newPreset("Rikako (2B)", 306, 0, 0, 239, 300, 239, 85, 0, 0, 139);
newPreset("Rika (2A)", 307, 0, 0, 241, 302, 226, 86, 0, 0, 0);
newPreset("Rika (2B)", 307, 0, 0, 242, 302, 226, 86, 0, 0, 0);
newPreset("Yuki (2)", 308, 0, 0, 243, 303, 240, 87, 0, 0, 0);
newPreset("VIVIT (2)", 309, 0, 0, 244, 304, 241, 79, 0, 0, 0);
newPreset("Mai (2)", 312, 0, 0, 245, 306, 242, 88, 0, 122, 0);
newPreset("Ellen (2)", 313, 0, 0, 246, 307, 183, 89, 0, 0, 0);
newPreset("Kana (2)", 314, 0, 0, 247, 308, 243, 90, 0, 0, 0);
newPreset("Elly (2)", 315, 0, 0, 248, 309, 245, 91, 0, 123, 0);
newPreset("Sara (2)", 316, 0, 0, 249, 0, 246, 92, 0, 0, 0);
newPreset("Meira (2)", 321, 0, 0, 250, 313, 247, 93, 90, 0, 0);
newPreset("Elis (2)", 322, 0, 0, 251, 314, 248, 94, 91, 41, 144);
newPreset("Shingyoku F (2)", 325, 0, 0, 252, 317, 226, 95, 0, 0, 0);
newPreset("Shingyoku M (2)", 326, 0, 0, 253, 318, 249, 96, 0, 0, 0);
newPreset("Yuka (PJ's 2)", 330, 0, 0, 254, 319, 250, 97, 0, 0, 0);
newPreset("Yukari (PCB 2)", 331, 0, 0, 255, 320, 251, 5, 0, 0, 0);
newPreset("Nazrin (2)", 333, 0, 0, 256, 321, 226, 101, 0, 43, 0);
newPreset("Kogasa (2)", 334, 81, 0, 257, 0, 248, 102, 154, 0, 0);
newPreset("Yukari (2)", 116, 0, 0, 258, 320, 112, 5, 0, 0, 0);
newPreset("Ichirin (2)", 337, 0, 0, 259, 324, 255, 103, 95, 0, 0);
newPreset("Shanghai (2)", 341, 0, 0, 260, 326, 256, 106, 0, 0, 0);
newPreset("Kyouko", 343, 0, 0, 261, 329, 258, 25, 0, 0, 0);
newPreset("Yoshika", 344, 0, 0, 262, 331, 0, 53, 0, 0, 152);
newPreset("Seiga", 345, 0, 0, 263, 334, 260, 25, 0, 132, 0);
newPreset("Tojiko", 346, 0, 0, 264, 335, 261, 117, 0, 0, 0);
newPreset("Futo", 347, 0, 0, 265, 336, 262, 118, 0, 0, 0);
newPreset("Miko", 348, 0, 0, 266, 337, 263, 41, 0, 0, 0);
newPreset("Miko (Alt)", 349, 0, 0, 266, 337, 263, 41, 0, 0, 154);
newPreset("Mamizou", 350, 0, 0, 267, 338, 264, 46, 0, 133, 155);
GameData.Toys = new Object();
GameData.Toys["Grouchy Reimu"] = new Object();
GameData.Toys["Grouchy Reimu"].frame = 1;
GameData.Toys["Gravity Well"] = new Object();
GameData.Toys["Gravity Well"].frame = 2;
GameData.Toys["Gravity Well"].Power = 5;
GameData.Toys["Gravity Well"].ShiftPower = 2;
GameData.Toys["Gravity Well"].CtrlPower = 10;
GameData.Toys["Gravity Well"].Friction = 1;
GameData.Toys["Mysterious Gap"] = new Object();
GameData.Toys["Mysterious Gap"].frame = 3;
GameData.Toys["Clone Capsule"] = new Object();
GameData.Toys["Clone Capsule"].frame = 4;
GameData.Toys["Clone Capsule"].Mode = 1;
GameData.Toys["Clone Capsule"].Delay = 0;
GameData.Toys["Clone Capsule"].Char = new Object();
GameData.Toys["Boxing Chen"] = new Object();
GameData.Toys["Boxing Chen"].frame = 5;
GameData.Toys["Boxing Chen"].Range = 120;
GameData.ObjectList = new Array();
a = 0;
while ((a < GameData.ObjectArray.length)) {
  GameData.ObjectList.push([GameData.ObjectArray[a][0], a]);
  a = a + 1;
}
GameData.ObjectList.sort();
GameData.PresetList = new Array();
/*enumerate*/
while (!(($r0 = <?>) == null)) {
  a = $r0;
  GameData.PresetList.push(a);
}
GameData.NewestChar = GameData.PresetList[0];
GameData.PresetList.sort();
LoadSavedData();
CheckOrigin();
_root.attachMovie("BGBox", "ClearClicker", 0);
ClearClicker._width = Stage.width;
ClearClicker._height = Stage.height;
ClearClicker._alpha = 0;
function () {
  CloseMenus(1);
  Target();
}
<?>[ClearClicker] = "onPress";
ClearClicker.useHandCursor = false;
_root.attachMovie("Background", "bg", 1);
_root.createEmptyMovieClip("stage", 10);
_root.attachMovie("BGBox", "Dimmer", 98);
SwapColor(Dimmer, "Buttons", 4);
Dimmer._width = Stage.width;
Dimmer._height = Stage.height;
Dimmer._alpha = 0;
_root.attachMovie("Manipulator", "Manipulator", 99);
Manipulator._visible = false;
function () {
  GameData.DoubleClick = 0;
  clickCheck(GameData.Target, "drag");
}
<?>[Manipulator.dragbox] = "onPress";
setActionRelease(Manipulator.dragbox);
Manipulator.attachMovie("ToolNode", "Positioner", 30);
Manipulator.Positioner.gotoAndStop(3);
function () {
  GameData.Action = "positionTool";
}
<?>[Manipulator.Positioner] = "onPress";
setActionRelease(Manipulator.Positioner);
Manipulator.attachMovie("ToolNode", "RotateTool", 10);
Manipulator.RotateTool.gotoAndStop(2);
function () {
  GameData.Action = "rotateTool";
}
<?>[Manipulator.RotateTool] = "onPress";
setActionRelease(Manipulator.RotateTool);
Manipulator.attachMovie("ToolNode", "ScaleTool", 20);
Manipulator.ScaleTool.gotoAndStop(1);
function () {
  GameData.Action = "scaleTool";
}
<?>[Manipulator.ScaleTool] = "onPress";
setActionRelease(Manipulator.ScaleTool);
Manipulator.attachMovie("ToolNode", "BScaleTool", 50);
Manipulator.BScaleTool.gotoAndStop(4);
function () {
  GameData.Action = "bScaleTool";
}
<?>[Manipulator.BScaleTool] = "onPress";
setActionRelease(Manipulator.BScaleTool);
Manipulator.attachMovie("ToolNode", "BTextTool", 40);
Manipulator.BTextTool.gotoAndStop(5);
function () {
  GameData.Action = "bTextTool";
}
<?>[Manipulator.BTextTool] = "onPress";
setActionRelease(Manipulator.BTextTool);
_root.createEmptyMovieClip("Interface", 100);
_root.createEmptyMovieClip("SysConsole", 150);
SysConsole._y = Stage.height / 2;
_root.attachMovie("BGBox", "TopDimmer", 300);
SwapColor(TopDimmer, "Buttons", 4);
TopDimmer._width = Stage.width;
TopDimmer._height = Stage.height;
TopDimmer._alpha = 0;
bg.gotoAndStop(1);
bg._visible = false;
MenuMaker = new Array();
MenuMaker.push(["TargetFrame", "ObjMenuItem"]);
MenuMaker.push(["HatMenu", ""]);
MenuMaker.push(["ItemMenu", ""]);
MenuMaker.push(["SceneActMenu", ""]);
MenuMaker.push(["AccMenu", ""]);
MenuMaker.push(["BackMenu", ""]);
MenuMaker.push(["ShoesMenu", ""]);
MenuMaker.push(["ArmsMenu", ""]);
MenuMaker.push(["BodyMenu", ""]);
MenuMaker.push(["HairMenu", ""]);
MenuMaker.push(["EyesMenu", ""]);
MenuMaker.push(["MouthMenu", ""]);
MenuMaker.push(["PresetMenu", ""]);
MenuMaker.push(["SavedCharMenu", ""]);
MenuMaker.push(["SavedSceneMenu", ""]);
MenuMaker.push(["ObjectList", ""]);
MenuMaker.push(["RenameMenu", "RenameMenu"]);
MenuMaker.push(["BGMenu", "BGMenu"]);
MenuMaker.push(["COMenu", "CharOptionsMenu"]);
MenuMaker.push(["BubbleWindow", "BubbleMenu"]);
MenuMaker.push(["GravMenu", "GravityMenu"]);
MenuMaker.push(["DNAMenu", "DNAMenu"]);
MenuMaker.push(["ConfirmBox", "ConfirmBox"]);
MenuMaker.push(["HelpWindow", ""]);
i = 0;
while ((i < MenuMaker.length)) {
  if (MenuMaker[i][1]) {
    GameData.Menus.DMax = GameData.Menus.DMax + 1;
    Interface.attachMovie(MenuMaker[i][1], MenuMaker[i][0], GameData.Menus.DMax);
  } else {
    GameData.Menus.DMax = GameData.Menus.DMax + 1;
    Interface.createEmptyMovieClip(MenuMaker[i][0], GameData.Menus.DMax);
  }
  ScaleMenu(Interface[MenuMaker[i][0]]);
  Interface[MenuMaker[i][0]]._visible = false;
  i = i + 1;
}
_root.attachMovie("BGBox", "ClickBlocker", 102);
ClickBlocker._width = Stage.width;
ClickBlocker._height = Stage.height;
ClickBlocker._alpha = 70;
SwapColor(ClickBlocker, "Buttons", 3);
function () {
}
<?>[ClickBlocker] = "onPress";
ClickBlocker.useHandCursor = false;
ClickBlocker._visible = false;
/*enumerate*/
while (!(($r0 = <?>) == null)) {
  t = $r0;
  AddProp(t, "Toys", "Toys");
  stage[t].gotoAndStop(GameData.Toys[t].frame);
  stage[t]._x = 200;
  stage[t]._y = 200;
  stage[t]._visible = false;
}
function () {
  this.startDrag();
  clickCheck(this, "");
}
<?>[stage["Grouchy Reimu"]] = "onPress";
function () {
  this.stopDrag();
}
<?>[stage["Grouchy Reimu"]] = "onRelease";
function () {
  this.stopDrag();
}
<?>[stage["Grouchy Reimu"]] = "onReleaseOutside";
function () {
  clickCheck(this, "drag");
}
<?>[stage["Gravity Well"]] = "onPress";
setActionRelease(stage["Gravity Well"]);
stage["Clone Capsule"].char._visible = false;
stage["Clone Capsule"].lights.gotoAndStop(1);
function () {
  clickCheck(this, "drag");
}
<?>[stage["Clone Capsule"]] = "onPress";
setActionRelease(stage["Clone Capsule"]);
function () {
  resetBoxingChen();
  clickCheck(this, "drag");
}
<?>[stage["Boxing Chen"]] = "onPress";
setActionRelease(stage["Boxing Chen"]);
function () {
  clickCheck(this, "drag");
}
<?>[stage["Mysterious Gap"]] = "onPress";
setActionRelease(stage["Mysterious Gap"]);
var myListener = new Object();
function () {
  fixScales();
}
<?>[myListener] = "onResize";
Stage.addListener(myListener);
function () {
  /*enumerate*/
  while (!(($r0 = <?>) == null)) {
    S = $r0;
    if ((SysConsole[S].CD > 0)) {
      SysConsole[S].CD = SysConsole[S].CD - 1;
    } else {
      if ((SysConsole[S]._alpha > 0)) {
        SysConsole[S]._alpha = SysConsole[S]._alpha - 20;
      } else {
        SysConsole[S].removeMovieClip();
      }
    }
  }
  if (!GameData.GameOn) {
    GameData.Keys.Functions.Main();
    if ((GameData.DoubleClick > 0)) {
      GameData.DoubleClick = GameData.DoubleClick - 1;
    }
    if ((GameData.Toys["Clone Capsule"].Delay > 0)) {
      GameData.Toys["Clone Capsule"].Delay = GameData.Toys["Clone Capsule"].Delay - 1;
    } else {
      if ((GameData.Toys["Clone Capsule"].Mode == 4)) {
        GameData.Toys["Clone Capsule"].Mode == 4;
      }
      if (stage["Clone Capsule"]._visible) {
        stage["Clone Capsule"]._visible;
      }
      if (stage["Clone Capsule"].char._visible) {
        activateCloneCapsule();
        GameData.Toys["Clone Capsule"].Delay = 30;
      }
    }
    if ((stage["Boxing Chen"].AttackRoll > 0)) {
      stage["Boxing Chen"].AttackRoll = stage["Boxing Chen"].AttackRoll - 1;
      if ((stage["Boxing Chen"].AttackRoll == 55)) {
        _root.attachMovie("KO", "KO", 6000);
        KO._xscale = GameData.Menus.Size * 0.9;
        KO._yscale = GameData.Menus.Size * 0.9;
      } else {
        if ((stage["Boxing Chen"].AttackRoll == 0)) {
          KO.removeMovieClip();
        }
      }
    }
    if (bg.chatW._visible) {
      bg.chatW._visible;
    }
    if (GameData.Chat.Active) {
      if ((GameData.Chat.D > 0)) {
        GameData.Chat.D = GameData.Chat.D - 1;
      } else {
        if ((GameData.Chat.L < 5)) {
          $r9 = "LOLSpark";
          GameData.Chat.L = GameData.Chat.L + 1;
        } else {
          $r9 = GameData.Chat.UserList[random(GameData.Chat.UserList.length)];
          GameData.Chat.L = 0;
        }
        playSound("ChatBeep");
        bg.chatW.chat.text = bg.chatW.chat.text + ($r9 + ": " + GameData.Chat.Users[$r9][random(GameData.Chat.Users[$r9].length)] + "\n");
        bg.chatW.chat.scroll = bg.chatW.chat.maxscroll;
        GameData.Chat.D = random(GameData.Chat.Delay) + 3;
      }
      if ((GameData.Chat.Doom > 0)) {
        GameData.Chat.Doom = GameData.Chat.Doom - 1;
        if ((GameData.Chat.Doom == 0)) {
          u = 0;
          while ((u < GameData.Chat.UserList.length)) {
            $r6 = GameData.Chat.UserList[u];
            if (!($r6 == "WakiMiko")) {
              bg.chatW.chat.text = bg.chatW.chat.text + ($r6 + " has disconnected.\n");
              bg.chatW.chat.scroll = bg.chatW.chat.maxscroll;
            }
            u = u + 1;
          }
          GameData.Chat.Active = false;
        }
      }
    }
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      n = $r0;
      /*enumerate*/
      while (!(($r0 = <?>) == null)) {
        o = $r0;
        stage[n][o]._rotation = stage[n][o]._rotation + stage[n][o].Rot;
        if (!(stage[n][o]._x < Stage.width + 50)) {
          stage[n][o]._x = -20;
        }
        if (!(stage[n][o]._y < Stage.height + 50)) {
          SetDrop(stage[n][o]);
        }
        stage[n][o]._y = stage[n][o]._y + stage[n][o].YMov;
        stage[n][o]._x = stage[n][o]._x + stage[n][o].XMov;
      }
    }
    if (!GameData.Target.Pin) {
      if ((GameData.Action == "rotateTool")) {
        Manipulator.RotateTool._x = _root._xmouse - Manipulator._x;
        Manipulator.RotateTool._y = _root._ymouse - Manipulator._y;
        if ((GameData.Target._yscale < 0)) {
          GameData.Target._rotation = getMouseAngle(Manipulator._x, Manipulator._y) + 180;
        } else {
          GameData.Target._rotation = getMouseAngle(Manipulator._x, Manipulator._y);
        }
      } else {
        if ((GameData.Action == "positionTool")) {
          Manipulator.Positioner._x = _root._xmouse - Manipulator._x;
          Manipulator.Positioner._y = _root._ymouse - Manipulator._y;
          if ((GameData.TargetType == "Cluster")) {
            GameData.Clusters[GameData.Target._name].Px = Manipulator.Positioner._x;
            GameData.Clusters[GameData.Target._name].Py = Manipulator.Positioner._y;
            fixClusterShotAngle(GameData.Target, GameData.Clusters[GameData.Target._name].Qt);
          } else {
            GameData.Target.Bubble._x = Manipulator.Positioner._x;
            GameData.Target.Bubble._y = Manipulator.Positioner._y;
          }
        } else {
          if ((GameData.Action == "scaleTool")) {
            Manipulator.ScaleTool._x = _root._xmouse - Manipulator._x;
            Manipulator.ScaleTool._y = _root._ymouse - Manipulator._y;
            if ((Manipulator.ScaleTool._x < 0)) {
              GameData.Target.XFace = -1;
            } else {
              GameData.Target.XFace = 1;
            }
            if ((Manipulator.ScaleTool._y < 0)) {
              GameData.Target.YFace = -1;
            } else {
              GameData.Target.YFace = 1;
            }
            $r12 = Math.abs(Manipulator.ScaleTool._x) + Math.abs(Manipulator.ScaleTool._y);
            if (($r12 < GameData.ScaleLimit)) {
              $r12 = GameData.ScaleLimit;
            }
            fixTargetScale($r12);
          } else {
            if ((GameData.Action == "bScaleTool")) {
              Manipulator.BScaleTool._x = _root._xmouse - Manipulator._x;
              Manipulator.BScaleTool._y = _root._ymouse - Manipulator._y;
              if ((Manipulator.BScaleTool._x < 0)) {
                GameData.Target.Bubble.XFace = -1;
              } else {
                GameData.Target.Bubble.XFace = 1;
              }
              if ((Manipulator.BScaleTool._y < 0)) {
                GameData.Target.Bubble.YFace = -1;
              } else {
                GameData.Target.Bubble.YFace = 1;
              }
              GameData.Target.Bubble._xscale = Math.abs(Manipulator.BScaleTool._x) * GameData.Target.Bubble.XFace;
              GameData.Target.Bubble._yscale = Math.abs(Manipulator.BScaleTool._y) * GameData.Target.Bubble.YFace;
              GameData.SpeechBubbles[GameData.Target._name].XScale = Math.abs(GameData.Target.Bubble._xscale);
              GameData.SpeechBubbles[GameData.Target._name].YScale = Math.abs(GameData.Target.Bubble._yscale);
            } else {
              if ((GameData.Action == "bTextTool")) {
                Manipulator.BTextTool._x = _root._xmouse - Manipulator._x;
                Manipulator.BTextTool._y = _root._ymouse - Manipulator._y;
                GameData.Target.D._x = Manipulator.BTextTool._x;
                GameData.Target.D._y = Manipulator.BTextTool._y;
              } else {
                if ((GameData.Action == "rotate")) {
                  if ((GameData.TargetType == "Character")) {
                    GameData.Target.OldR = GameData.Target._rotation;
                    if ((GameData.Target._yscale < 0)) {
                      GameData.Target._rotation = getMouseAngle(GameData.Target._x, GameData.Target._y) + 180;
                    } else {
                      GameData.Target._rotation = getMouseAngle(GameData.Target._x, GameData.Target._y);
                    }
                    GameData.Target.Spin = Math.floor(GameData.Target._rotation - GameData.Target.OldR);
                  } else {
                    if (!(GameData.TargetType == "Object")) {
                      GameData.TargetType == "Object";
                    }
                    if (!(GameData.TargetType == "Screenshot")) {
                      GameData.TargetType == "Screenshot";
                    }
                    if ((GameData.TargetType == "Cluster")) {
                      if ((GameData.Target._yscale < 0)) {
                        GameData.Target._rotation = getMouseAngle(GameData.Target._x, GameData.Target._y) + 180;
                      } else {
                        GameData.Target._rotation = getMouseAngle(GameData.Target._x, GameData.Target._y);
                      }
                    } else {
                      if ((GameData.TargetType == "SpeechBubble")) {
                        if ((GameData.Target.Bubble._yscale < 0)) {
                          GameData.Target.Bubble._rotation = getMouseAngle(GameData.Target._x + GameData.Target.Bubble._x, GameData.Target._y + GameData.Target.Bubble._y) + 10;
                        } else {
                          GameData.Target.Bubble._rotation = getMouseAngle(GameData.Target._x + GameData.Target.Bubble._x, GameData.Target._y + GameData.Target.Bubble._y) + 170;
                        }
                      }
                    }
                  }
                } else {
                  if ((GameData.Action == "drag")) {
                    GameData.Target.OldX = GameData.Target._x;
                    GameData.Target.OldY = GameData.Target._y;
                    GameData.Target._x = _root._xmouse - GameData.Xmod;
                    Manipulator._x = GameData.Target._x;
                    GameData.Target._y = _root._ymouse - GameData.Ymod;
                    Manipulator._y = GameData.Target._y;
                    GameData.Target.XMov = Math.floor(GameData.Target._x - GameData.Target.OldX);
                    GameData.Target.YMov = Math.floor(GameData.Target._y - GameData.Target.OldY);
                  } else {
                    if ((GameData.Action == "scale")) {
                      if ((GameData.TargetType == "SpeechBubble")) {
                        if (Key.isDown(17)) {
                          $r11 = _root._xmouse - GameData.Xmod;
                          $r10 = _root._ymouse - GameData.Ymod;
                          if ((GameData.Target.OldXScale + $r11 < GameData.ScaleLimit)) {
                            GameData.SpeechBubbles[GameData.Target._name].XScale = GameData.ScaleLimit;
                          } else {
                            GameData.SpeechBubbles[GameData.Target._name].XScale = GameData.Target.OldXScale + $r11;
                          }
                          if ((GameData.Target.OldYScale + $r10 < GameData.ScaleLimit)) {
                            GameData.SpeechBubbles[GameData.Target._name].YScale = GameData.ScaleLimit;
                          } else {
                            GameData.SpeechBubbles[GameData.Target._name].YScale = GameData.Target.OldYScale + $r10;
                          }
                          GameData.Target.Bubble._xscale = GameData.SpeechBubbles[GameData.Target._name].XScale * GameData.Target.Bubble.XFace;
                          GameData.Target.Bubble._yscale = GameData.SpeechBubbles[GameData.Target._name].YScale * GameData.Target.Bubble.YFace;
                        } else {
                          var S = _root._xmouse - GameData.Xmod + (_root._ymouse - GameData.Ymod);
                          if ((GameData.Target.OldScale + S < GameData.ScaleLimit)) {
                            $r12 = GameData.ScaleLimit;
                          } else {
                            $r12 = GameData.Target.OldScale + S;
                          }
                          fixTargetScale($r12);
                        }
                      } else {
                        var S = _root._xmouse - GameData.Xmod + (_root._ymouse - GameData.Ymod);
                        if ((GameData.Target.OldScale + S < GameData.ScaleLimit)) {
                          $r12 = GameData.ScaleLimit;
                        } else {
                          $r12 = GameData.Target.OldScale + S;
                        }
                        fixTargetScale($r12);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    /*enumerate*/
    while (!(($r0 = <?>) == null)) {
      c = $r0;
      if (!stage[c].Pin) {
        if ((bg.yuyuko._currentframe == 2)) {
          bg.yuyuko._currentframe == 2;
        }
        if (stage[c]._visible) {
          stage[c]._visible;
        }
        if (GameData.Characters[stage[c]._name]) {
          $r4 = 330 * (bg._xscale / 100) + bg._x;
          $r5 = 230 * (bg._yscale / 100) + bg._y;
          $r7 = getDist(stage[c], $r4, $r5);
          $r3 = 6 - Math.ceil($r7 / 100);
          if (!(stage[c].eyes._currentframe == 28)) {
            stage[c].eyes.gotoAndStop(29);
          }
          if (!(stage[c].mouth._currentframe == 14)) {
            stage[c].mouth.gotoAndStop(14);
          }
          if (($r3 < 1)) {
            $r3 = 1;
          }
          Propel(stage[c], getAngle(stage[c]._x, stage[c]._y, $r4, $r5), $r3);
          if (($r7 < 20)) {
            playSound("Kyuh");
            Delete(stage[c]);
          } else {
            if (($r7 < GameData.Characters[c].Scale)) {
              stage[c]._xscale = $r7;
              stage[c]._yscale = $r7;
            }
          }
          if (($r3 > 1)) {
            $r8 = 90 - $r7;
            if ((stage[c].Spin < $r8)) {
              stage[c].Spin = stage[c].Spin + $r3 * 3;
            }
          }
        }
        if (stage["Gravity Well"]._visible) {
          stage["Gravity Well"]._visible;
        }
        if (stage[c]._visible) {
          stage[c]._visible;
        }
        if (GameData.Characters[stage[c]._name]) {
          $r2 = "Power";
          if ((GameData.Target._name == "Gravity Well")) {
            if (Key.isDown(16)) {
              $r2 = "ShiftPower";
            } else {
              if (Key.isDown(17)) {
                $r2 = "CtrlPower";
              }
            }
          }
          if ((stage[c]._x < stage["Gravity Well"]._x)) {
            stage[c].XMov = stage[c].XMov + GameData.Toys["Gravity Well"][$r2];
          } else {
            stage[c].XMov = stage[c].XMov - GameData.Toys["Gravity Well"][$r2];
          }
          if ((stage[c]._y < stage["Gravity Well"]._y)) {
            stage[c].YMov = stage[c].YMov + GameData.Toys["Gravity Well"][$r2];
          } else {
            stage[c].YMov = stage[c].YMov - GameData.Toys["Gravity Well"][$r2];
          }
          $r7 = getDist(stage["Gravity Well"], stage[c]._x, stage[c]._y);
          if (($r7 < 90)) {
            $r8 = 90 - $r7;
            if ((stage[c].Spin < $r8)) {
              stage[c].Spin = stage[c].Spin + GameData.Toys["Gravity Well"][$r2];
            }
          }
        }
        if ((stage[c].Doom > 0)) {
          if ((stage[c].Doom > 30)) {
            if (!(stage[c].eyes._currentframe == 28)) {
              stage[c].eyes.gotoAndStop(29);
            }
            if (!(stage[c].mouth._currentframe == 14)) {
              stage[c].mouth.gotoAndStop(14);
            }
          } else {
            if (stage[c].accessory._visible) {
              !stage[c].accessory._visible;
            }
            if (!(stage[c].accessory._currentframe == 21)) {
              playSound("Boom");
              stage[c].accessory._visible = true;
              stage[c].accessory.gotoAndStop(21);
            }
          }
          stage[c].Doom = stage[c].Doom - 1;
          if ((stage[c].Doom == 0)) {
            Delete(stage[c]);
          }
        }
        if (!(stage[c].Spin == 0)) {
          !(stage[c].Spin == 0);
        }
        if ((GameData.Target == stage[c])) {
          !(GameData.Target == stage[c]);
          if (!(stage[c].Spin == 0)) {
            !(stage[c].Spin == 0);
          }
        }
        if (!(GameData.Action == "rotate")) {
          if (stage[c].Spin) {
            stage[c]._rotation = stage[c]._rotation + stage[c].Spin;
          }
          if ((stage[c].Spin > 0)) {
            stage[c].Spin = Math.floor(stage[c].Spin * GameData.Friction);
          } else {
            stage[c].Spin = Math.ceil(stage[c].Spin * GameData.Friction);
          }
        }
        if (!(stage[c].XMov == 0)) {
          !(stage[c].XMov == 0);
        }
        if ((GameData.Target == stage[c])) {
          !(GameData.Target == stage[c]);
          if (!(stage[c].XMov == 0)) {
            !(stage[c].XMov == 0);
          }
        }
        if (!(GameData.Action == "drag")) {
          if (stage[c].XMov) {
            if ((stage[c]._x + stage[c].XMov < 0)) {
              stage[c]._x = 0;
              stage[c].XMov = stage[c].XMov * -1;
            } else {
              if ((stage[c]._x + stage[c].XMov > Stage.width)) {
                stage[c]._x = Stage.width;
                stage[c].XMov = stage[c].XMov * -1;
              } else {
                stage[c]._x = stage[c]._x + stage[c].XMov;
                if ((stage[c] == GameData.Target)) {
                  Manipulator._x = stage[c]._x;
                }
              }
            }
          }
          if ((stage[c]._name == "Gravity Well")) {
            if ((stage[c].XMov > 0)) {
              stage[c].XMov = Math.floor(stage[c].XMov * GameData.Toys["Gravity Well"].Friction);
            } else {
              stage[c].XMov = Math.ceil(stage[c].XMov * GameData.Toys["Gravity Well"].Friction);
            }
          } else {
            if ((stage[c].XMov > 0)) {
              stage[c].XMov = Math.floor(stage[c].XMov * GameData.Friction);
            } else {
              stage[c].XMov = Math.ceil(stage[c].XMov * GameData.Friction);
            }
          }
        }
        if (!(stage[c].YMov == 0)) {
          !(stage[c].YMov == 0);
        }
        if ((GameData.Target == stage[c])) {
          !(GameData.Target == stage[c]);
          if (!(stage[c].YMov == 0)) {
            !(stage[c].YMov == 0);
          }
        }
        if (!(GameData.Action == "drag")) {
          if (stage[c].YMov) {
            if ((stage[c]._y + stage[c].YMov < 0)) {
              stage[c]._y = 0;
              stage[c].YMov = stage[c].YMov * -1;
            } else {
              if ((stage[c]._y + stage[c].YMov > Stage.height)) {
                stage[c]._y = Stage.height;
                stage[c].YMov = stage[c].YMov * -1;
              } else {
                stage[c]._y = stage[c]._y + stage[c].YMov;
                if ((stage[c] == GameData.Target)) {
                  Manipulator._y = stage[c]._y;
                }
              }
            }
          }
          if ((stage[c]._name == "Gravity Well")) {
            if ((stage[c].YMov > 0)) {
              stage[c].YMov = Math.floor(stage[c].YMov * GameData.Toys["Gravity Well"].Friction);
            } else {
              stage[c].YMov = Math.ceil(stage[c].YMov * GameData.Toys["Gravity Well"].Friction);
            }
          } else {
            if ((stage[c].YMov > 0)) {
              stage[c].YMov = Math.floor(stage[c].YMov * GameData.Friction);
            } else {
              stage[c].YMov = Math.ceil(stage[c].YMov * GameData.Friction);
            }
          }
        }
      }
    }
  }
}
<?>[Interface] = "onEnterFrame";
GameData.Frames = new Object();
addWindow("GeneralOptions", 100, 300, "Options");
addTextInput("GeneralOptions", "x", 15, 45, "X:", "isXLoc", 18, 20, 50);
addTextInput("GeneralOptions", "y", 95, 45, "Y:", "isYLoc", 18, 20, 50);
addTextInput("GeneralOptions", "s", 175, 45, "Scale:", "isScale", 18, 55, 50);
addTextInput("GeneralOptions", "r", 15, 70, "Rotation:", "isRotation", 18, 75, 50);
addButton("GeneralOptions", "CloseB", 160, 70, "Close", "CloseWindow");
addWindow("BlurSettings", 125, 300, "Blur Settings");
addTextInput("BlurSettings", "x", 15, 45, "X:", "isBlurX", 18, 20, 50);
addTextInput("BlurSettings", "y", 95, 45, "Y:", "isBlurY", 18, 20, 50);
addTextInput("BlurSettings", "q", 175, 45, "Quality:", "isBlurQ", 18, 65, 45);
addButton("BlurSettings", "ApplyB", 15, 70, "Apply", "SetFilter-Blur");
addButton("BlurSettings", "ClearB", 160, 70, "Clear", "ClearFilter-Blur");
addButton("BlurSettings", "CloseB", 10, 95, "Close", "CloseWindow");
addWindow("SceneSettings", 150, 300, "Scene Info");
addTextInput("SceneSettings", "sN", 15, 45, "Scene Name:", "isSceneName", 18, 100, 150);
addTextInput("SceneSettings", "Ps", 15, 65, "Prev Scene:", "isPrevScene", 18, 100, 150);
addTextInput("SceneSettings", "Ns", 15, 85, "Next Scene:", "isNextScene", 18, 100, 150);
addButton("SceneSettings", "CloseSS", 15, 125, "Close", "CloseWindow");
addWindow("SnapshotOptions", 125, 300, "Snapshot Options");
addTextInput("SnapshotOptions", "x", 15, 45, "X:", "isXLoc", 18, 20, 50);
addTextInput("SnapshotOptions", "y", 95, 45, "Y:", "isYLoc", 18, 20, 50);
addTextInput("SnapshotOptions", "s", 175, 45, "Scale:", "isScale", 18, 55, 50);
addTextInput("SnapshotOptions", "r", 15, 70, "Rotation:", "isRotation", 18, 75, 50);
addTextInput("SnapshotOptions", "o", 160, 70, "Opacity:", "isAlpha", 18, 75, 50);
addButton("SnapshotOptions", "CloseB", 100, 95, "Close", "CloseWindow");
addWindow("RainOptions", 180, 300, "Rain Options");
addTextInput("RainOptions", "x", 15, 45, "X:", "isXLoc", 18, 20, 50);
addTextInput("RainOptions", "y", 95, 45, "Y:", "isYLoc", 18, 20, 50);
addTextInput("RainOptions", "s", 175, 45, "Scale:", "isScale", 18, 55, 50);
addTextInput("RainOptions", "r", 15, 70, "Rotation:", "isRotation", 18, 75, 50);
addTextInput("RainOptions", "d", 160, 70, "Density:", "isRDensity", 18, 65, 50);
addTextInput("RainOptions", "xmin", 15, 95, "X:", "isRXMin", 18, 15, 40);
addTextInput("RainOptions", "xmax", 75, 95, "-", "isRXMax", 18, 15, 40);
addTextInput("RainOptions", "ymin", 150, 95, "Y:", "isRYMin", 18, 15, 40);
addTextInput("RainOptions", "ymax", 210, 95, "-", "isRYMax", 18, 15, 40);
addTextInput("RainOptions", "tmin", 50, 120, "Twirl:", "isRTwirlMin", 18, 55, 40);
addTextInput("RainOptions", "tmax", 150, 120, "-", "isRTwirlMax", 18, 15, 40);
addButton("RainOptions", "CloseB", 100, 145, "Close", "CloseWindow");
addWindow("ClusterOptions", 190, 300, "Cluster Options");
addTextInput("ClusterOptions", "x", 15, 45, "X:", "isXLoc", 18, 20, 50);
addTextInput("ClusterOptions", "y", 95, 45, "Y:", "isYLoc", 18, 20, 50);
addTextInput("ClusterOptions", "s", 175, 45, "Scale:", "isScale", 18, 55, 50);
addTextInput("ClusterOptions", "r", 15, 70, "Rotation:", "isRotation", 18, 75, 50);
addTextInput("ClusterOptions", "dist", 155, 70, "Distance:", "isClusterDist", 18, 75, 50);
addTextInput("ClusterOptions", "sprl", 15, 93, "Spiral:", "isClusterSpiral", 18, 65, 50);
addTextInput("ClusterOptions", "rmod", 140, 93, "RMod:", "isClusterRMod", 18, 50, 50);
addTextInput("ClusterOptions", "rows", 15, 120, "Rows:", "isClusterRows", 18, 50, 30);
addTextInput("ClusterOptions", "cols", 100, 120, "Cols:", "isClusterCols", 18, 48, 30);
addButton("ClusterOptions", "CloseB", 185, 120, "Close", "CloseWindow");
addTextInput("ClusterOptions", "sd", 25, 146, "Start D.:", "isClusterSD", 18, 75, 40);
addTextInput("ClusterOptions", "sp", 150, 146, "Spread:", "isClusterSpread", 18, 70, 40);
addText("ClusterOptions", "dir", 25, 168, "Shot Direction:", 18, 150);
addButton("ClusterOptions", "cdir", 155, 168, "isClusterDir", "ClusterDir");
addWindow("ColorizeMenu", 175, 350, "Colorize Menu");
addTextInput("ColorizeMenu", "rgbc", 25, 120, "RGB Code:", "isRGB", 18, 85, 80);
addButton("ColorizeMenu", "RandomC", 10, 146, "Randomize", "SetRandomColor");
addButton("ColorizeMenu", "DefaultC", 120, 146, "Default", "SetDefaultColor");
addButton("ColorizeMenu", "CloseB", 230, 146, "Close", "CloseWindow");
/*enumerate*/
while (!(($r0 = <?>) == null)) {
  i = $r0;
  makeFrame(i);
}
Interface.ClusterOptions.rowsI.maxChars = 2;
Interface.ClusterOptions.colsI.maxChars = 2;
Interface.ColorizeMenu.createEmptyMovieClip("palette", 50);
Interface.ColorizeMenu.palette._x = 75;
Interface.ColorizeMenu.palette._y = 55;
Interface.ColorizeMenu.palette.attachMovie("ColorBar", "Rb", 1);
Interface.ColorizeMenu.palette.Rb.gotoAndStop(1);
Interface.ColorizeMenu.palette.attachMovie("Slider", "Rs", 2);
Interface.ColorizeMenu.palette.Rb._y = 5;
Interface.ColorizeMenu.palette.Rs._y = 5;
Interface.ColorizeMenu.palette.attachMovie("ColorBar", "Gb", 3);
Interface.ColorizeMenu.palette.attachMovie("Slider", "Gs", 4);
Interface.ColorizeMenu.palette.Gb.gotoAndStop(2);
Interface.ColorizeMenu.palette.Gb._y = 25;
Interface.ColorizeMenu.palette.Gs._y = 25;
Interface.ColorizeMenu.palette.attachMovie("ColorBar", "Bb", 5);
Interface.ColorizeMenu.palette.attachMovie("Slider", "Bs", 6);
Interface.ColorizeMenu.palette.Bb.gotoAndStop(3);
Interface.ColorizeMenu.palette.Bb._y = 45;
Interface.ColorizeMenu.palette.Bs._y = 45;
Interface.ColorizeMenu.palette.attachMovie("ColorPatch", "Cp", 7);
Interface.ColorizeMenu.palette.Cp._x = -60;
function () {
  this.startDrag(false, 0, this._y, 255, this._y);
  function () {
    SwapPalette(this._parent);
  }
  <?>[this] = "onEnterFrame";
}
<?>[Interface.ColorizeMenu.palette.Rs] = "onPress";
setColorSliderRelease(Interface.ColorizeMenu.palette.Rs);
function () {
  this.startDrag(false, 0, this._y, 255, this._y);
  function () {
    SwapPalette(this._parent);
  }
  <?>[this] = "onEnterFrame";
}
<?>[Interface.ColorizeMenu.palette.Gs] = "onPress";
setColorSliderRelease(Interface.ColorizeMenu.palette.Gs);
function () {
  this.startDrag(false, 0, this._y, 255, this._y);
  function () {
    SwapPalette(this._parent);
  }
  <?>[this] = "onEnterFrame";
}
<?>[Interface.ColorizeMenu.palette.Bs] = "onPress";
setColorSliderRelease(Interface.ColorizeMenu.palette.Bs);
var newCharCheck = GameData.Settings.DefaultChar.Value.toLowerCase();
if ((newCharCheck == "newest")) {
  makeChar(GameData.NewestChar);
} else {
  makeChar(GameData.Settings.DefaultChar.Value);
}
makeNewMenu(Interface, "Level1Menu", 10);
makeNewMenu(Interface, "Level2Menu", 10);
makeNewMenu(Interface, "Level3Menu", 10);
Interface.HelpWindow.attachMovie("SpeechBubble", "EirinTalk", 1);
makePresetChar(Interface.HelpWindow, "Eirin (2)", "Eirin", 2);
Interface.HelpWindow.Eirin.mouth._visible = true;
Interface.HelpWindow.Eirin.mouth.gotoAndStop(51);
makeMenu(Interface.HelpWindow, "BasicHelpMenu", 3, ["Nevermind", "The Basics", "Latest Updates", "User Manual", "Got Any Rumors?", "About This Program"], 0, 0);
Interface.HelpWindow.Eirin._xscale = -50;
Interface.HelpWindow.Eirin._yscale = 50;
Interface.HelpWindow.Eirin._x = 320;
Interface.HelpWindow.Eirin._y = 200;
function () {
  this._parent.startDrag();
}
<?>[Interface.HelpWindow.Eirin] = "onPress";
function () {
  this._parent.stopDrag();
}
<?>[Interface.HelpWindow.Eirin] = "onRelease";
function () {
  this._parent.stopDrag();
}
<?>[Interface.HelpWindow.Eirin] = "onReleaseOutside";
Interface.HelpWindow.EirinTalk.Bubble.gotoAndStop(1);
Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Intro;
Interface.HelpWindow.EirinTalk.D._y = -25;
Interface.HelpWindow.EirinTalk.D._x = -225;
Interface.HelpWindow.EirinTalk.D._height = 300;
Interface.HelpWindow.EirinTalk.Bubble._rotation = 270;
Interface.HelpWindow.EirinTalk.Bubble._xscale = 120;
Interface.HelpWindow.EirinTalk.Bubble._yscale = 130;
Interface.HelpWindow.EirinTalk.Bubble._x = -110;
Interface.HelpWindow.EirinTalk.Bubble._y = 80;
Interface.HelpWindow.EirinTalk._x = 170;
PositionMenu(Interface.HelpWindow, "L", "T", 130, 100, null, null);
Interface.HelpWindow.attachMovie("Arrow", "Next", 4);
Interface.HelpWindow.Next._xscale = -50;
Interface.HelpWindow.Next._yscale = 50;
Interface.HelpWindow.Next._x = 75;
Interface.HelpWindow.Next._y = 190;
Interface.HelpWindow.Next._visible = false;
Interface.HelpWindow.attachMovie("WalfasLink", "WalfasLink", 5);
Interface.HelpWindow.WalfasLink._x = GameData.Help.WalfasLinkX;
Interface.HelpWindow.WalfasLink._y = GameData.Help.WalfasLinkY;
Interface.HelpWindow.WalfasLink._visible = false;
Interface.HelpWindow.attachMovie("MenuItem", "TellMore", 6);
Interface.HelpWindow.TellMore.bName.text = "Tell me more";
Interface.HelpWindow.TellMore.BG._width = 112;
Interface.HelpWindow.TellMore.bName._width = 112;
Interface.HelpWindow.TellMore._x = 0;
Interface.HelpWindow.TellMore._y = 160;
Interface.HelpWindow.TellMore._visible = false;
setButtonStyle(Interface.HelpWindow.TellMore);
function () {
  SwapColor(this.BG, "Buttons", 1);
  Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Rumors[random(GameData.Help.Rumors.length)];
  playSound("Pop");
}
<?>[Interface.HelpWindow.TellMore] = "onRelease";
Interface.HelpWindow.BasicHelpMenu._y = 160;
Interface.HelpWindow.BasicHelpMenu._x = -28;
Interface.HelpWindow.BasicHelpMenu._visible = true;
/*enumerate*/
while (!(($r0 = <?>) == null)) {
  b = $r0;
  Interface.HelpWindow.BasicHelpMenu[b].BG._width = 200;
  Interface.HelpWindow.BasicHelpMenu[b].bName._width = 200;
}
function () {
  SwapColor(this.BG, "Buttons", 1);
  CloseMenus(2);
}
<?>[Interface.HelpWindow.BasicHelpMenu.ID0] = "onRelease";
function () {
  this._parent._visible = false;
  playSound("Pop");
  Interface.HelpWindow.Next._visible = true;
  SwapColor(this.BG, "Buttons", 1);
  Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Basics;
  function () {
    resetHelp();
  }
  <?>[Interface.HelpWindow.Next] = "onRelease";
}
<?>[Interface.HelpWindow.BasicHelpMenu.ID1] = "onRelease";
function () {
  this._parent._visible = false;
  playSound("Pop");
  Interface.HelpWindow.Next._visible = true;
  SwapColor(this.BG, "Buttons", 1);
  Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Updates;
  function () {
    resetHelp();
  }
  <?>[Interface.HelpWindow.Next] = "onRelease";
}
<?>[Interface.HelpWindow.BasicHelpMenu.ID2] = "onRelease";
function () {
  getURL("http://www.heavenlypandemonium.com/?page_id=29","_blank");
}
<?>[Interface.HelpWindow.BasicHelpMenu.ID3] = "onRelease";
function () {
  this._parent._visible = false;
  playSound("Pop");
  Interface.HelpWindow.Next._visible = true;
  Interface.HelpWindow.TellMore._visible = true;
  SwapColor(this.BG, "Buttons", 1);
  Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Rumors[random(GameData.Help.Rumors.length)];
  function () {
    resetHelp();
  }
  <?>[Interface.HelpWindow.Next] = "onRelease";
}
<?>[Interface.HelpWindow.BasicHelpMenu.ID4] = "onRelease";
function () {
  this._parent._visible = false;
  playSound("Pop");
  Interface.HelpWindow.Next._visible = true;
  Interface.HelpWindow.WalfasLink._visible = true;
  SwapColor(this.BG, "Buttons", 1);
  Interface.HelpWindow.EirinTalk.D.text = GameData.Help.About;
  function () {
    resetHelp();
  }
  <?>[Interface.HelpWindow.Next] = "onRelease";
}
<?>[Interface.HelpWindow.BasicHelpMenu.ID5] = "onRelease";
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeButton(Interface, "MainMenu", "Menu", GameData.Menus.DMax);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "StageMenu", GameData.Menus.DMax, ["Shrink All", "Scramble!", "Randomize All"], 0, 0);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "GlobalLockMenu", GameData.Menus.DMax, ["Unlock All", "Lock All", "Hats", "Items", "Accessory", "Back", "Shoes", "Arms", "Body", "Hair", "Eyes", "Mouth"], 30, 0);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "InsertMenu", GameData.Menus.DMax, ["Speech Bubble", "Object"], 0, 0);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
Interface.attachMovie("MenuItem", "SceneFrame", GameData.Menus.DMax);
Interface.SceneFrame.bName.text = GameData.CurrentScene.Name + " : Part " + (GameData.CurrentScene.CurrentAct + 1);
setButtonStyle(Interface.SceneFrame);
PositionMenu(Interface.SceneFrame, "L", "T", 0, 3, null, null);
PositionMenu(Interface.MainMenu, "L", "B", 0, 3, null, null);
makeThumbMenu(Interface.PresetMenu, "PresetList", "HeadPreview", 20, 15, 20, 100, 100, "char");
PositionMenu(Interface.PresetMenu, "C", "C", 117, -238, Interface.MainMenu, Interface.MainMenu);
makeListMenu(Interface.SavedCharMenu, "SavedChars", 100, 100);
PositionMenu(Interface.SavedCharMenu, "C", "C", 117, -238, Interface.MainMenu, Interface.MainMenu);
makeListMenu(Interface.SavedSceneMenu, "SavedScenes", 100, 100);
PositionMenu(Interface.SavedSceneMenu, "C", "C", 117, -238, Interface.MainMenu, Interface.MainMenu);
RefreshActList();
PositionMenu(Interface.GlobalLockMenu, "C", "C", 147, -20, Interface.MainMenu, Interface.MainMenu);
b = 0;
while ((b < 12)) {
  Interface.GlobalLockMenu["ID" + b].BG._width = 120;
  Interface.GlobalLockMenu["ID" + b].bName._width = 120;
  if ((b > 1)) {
    Interface.GlobalLockMenu["ID" + b].attachMovie("checkbox", "checkbox", 10);
    Interface.GlobalLockMenu["ID" + b].checkbox.gotoAndStop(1);
    Interface.GlobalLockMenu["ID" + b].checkbox._xscale = 75;
    Interface.GlobalLockMenu["ID" + b].checkbox._yscale = 75;
    Interface.GlobalLockMenu["ID" + b].checkbox._y = 10;
    Interface.GlobalLockMenu["ID" + b].checkbox._x = 110;
    function () {
      if (GameData.Locks[this.bName.text]) {
        GameData.Locks[this.bName.text] = false;
        this.checkbox.gotoAndStop(1);
      } else {
        GameData.Locks[this.bName.text] = true;
        this.checkbox.gotoAndStop(2);
      }
    }
    <?>[Interface.GlobalLockMenu["ID" + b]] = "onRelease";
  }
  b = b + 1;
}
function () {
  l = 2;
  while ((l < 12)) {
    Interface.GlobalLockMenu["ID" + l].checkbox.gotoAndStop(1);
    GameData.Locks[Interface.GlobalLockMenu["ID" + l].bName.text] = false;
    if (GameData.Settings.MassLocking.Check) {
      /*enumerate*/
      while (!(($r0 = <?>) == null)) {
        i = $r0;
        GameData.Characters[i].Locks[Interface.GlobalLockMenu["ID" + l].bName.text] = false;
      }
    }
    l = l + 1;
  }
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.GlobalLockMenu.ID0] = "onRelease";
function () {
  l = 2;
  while ((l < 12)) {
    Interface.GlobalLockMenu["ID" + l].checkbox.gotoAndStop(2);
    GameData.Locks[Interface.GlobalLockMenu["ID" + l].bName.text] = true;
    if (GameData.Settings.MassLocking.Check) {
      /*enumerate*/
      while (!(($r0 = <?>) == null)) {
        i = $r0;
        GameData.Characters[i].Locks[Interface.GlobalLockMenu["ID" + l].bName.text] = true;
      }
    }
    l = l + 1;
  }
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.GlobalLockMenu.ID1] = "onRelease";
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "Grouchy ReimuMenu", GameData.Menus.DMax, ["Pay Money", "Hey Reimu!"], 0, Stage.height - 20);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "Gravity WellMenu", GameData.Menus.DMax, ["Dismiss", "Settings"], 0, Stage.height - 20);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "Clone CapsuleMenu", GameData.Menus.DMax, ["Disassemble", "Activate!", "Eject", "Tinker", "DNA Data"], 0, Stage.height - 20);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "Clone CapsuleEmptyMenu", GameData.Menus.DMax, ["Disassemble", "Input DNA", "Tinker"], 0, Stage.height - 20);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "Boxing ChenMenu", GameData.Menus.DMax, ["Send Home"], 0, Stage.height - 20);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "Mysterious GapMenu", GameData.Menus.DMax, ["Dismiss"], 0, Stage.height - 20);
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "BubbleMenu", GameData.Menus.DMax, ["Delete", "Edit Text", "Bring to Front", "Bring Forward", "Send Backwards", "Send to Back", "Vertical Flip", "Horizontal Flip", "Settings"], 0, Stage.height - 20);
PositionMenu(Interface.BubbleMenu, "C", "C", 30, -20, Interface.TargetFrame, Interface.TargetFrame);
function () {
  SwapColor(this.BG, "Buttons", 1);
  CloseMenus(1);
  delete GameData.SpeechBubbles[GameData.Target];
  GameData.Target.removeMovieClip();
  Target();
}
<?>[Interface.BubbleMenu.ID0] = "onRelease";
function () {
  SwapColor(this.BG, "Buttons", 1);
  CloseMenus(1);
  editBubble(GameData.Target);
}
<?>[Interface.BubbleMenu.ID1] = "onRelease";
function () {
  BringToFront(GameData.Target);
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.BubbleMenu.ID2] = "onRelease";
function () {
  BringForward(GameData.Target);
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.BubbleMenu.ID3] = "onRelease";
function () {
  SendBackward(GameData.Target);
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.BubbleMenu.ID4] = "onRelease";
function () {
  SendToBack(GameData.Target);
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.BubbleMenu.ID5] = "onRelease";
function () {
  GameData.Target.Bubble.YFace = GameData.Target.Bubble.YFace * -1;
  GameData.Target.Bubble._yscale = GameData.Target.Bubble._yscale * -1;
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.BubbleMenu.ID6] = "onRelease";
function () {
  GameData.Target.Bubble.XFace = GameData.Target.Bubble.XFace * -1;
  GameData.Target.Bubble._xscale = GameData.Target.Bubble._xscale * -1;
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.BubbleMenu.ID7] = "onRelease";
function () {
  OpenMenu(1, Interface.BubbleWindow, this.BG);
  Interface.BubbleWindow.gX.text = GameData.Target._x;
  Interface.BubbleWindow.gY.text = GameData.Target._y;
  Interface.BubbleWindow.gXs.text = GameData.Target._xscale;
  Interface.BubbleWindow.gYs.text = GameData.Target._yscale;
  Interface.BubbleWindow.gR.text = GameData.Target._rotation;
  Interface.BubbleWindow.bX.text = GameData.Target.Bubble._x;
  Interface.BubbleWindow.bY.text = GameData.Target.Bubble._y;
  Interface.BubbleWindow.bXs.text = GameData.Target.Bubble._xscale;
  Interface.BubbleWindow.bYs.text = GameData.Target.Bubble._yscale;
  Interface.BubbleWindow.bR.text = GameData.Target.Bubble._rotation;
  Interface.BubbleWindow.tX.text = GameData.Target.D._x;
  Interface.BubbleWindow.tY.text = GameData.Target.D._y;
  Interface.BubbleWindow.tR.text = GameData.Target.D._rotation;
}
<?>[Interface.BubbleMenu.ID8] = "onRelease";
PositionMenu(Interface.BubbleWindow, "C", "C", -50, -300, Interface.TargetFrame, Interface.TargetFrame);
Interface.BubbleWindow.BG._alpha = GameData.Buttons.Opacity;
setBGDrag(Interface.BubbleWindow.BG);
makeButton(Interface.BubbleWindow, "Set", "set", 151);
Interface.BubbleWindow.Set._x = 340;
Interface.BubbleWindow.Set._y = 220;
setButtonStyle(Interface.BubbleWindow.Set);
function () {
  SwapColor(this.BG, "Buttons", 1);
  GameData.Target._x = Number(Interface.BubbleWindow.gX.text);
  GameData.Target._y = Number(Interface.BubbleWindow.gY.text);
  GameData.Target._xscale = Number(Interface.BubbleWindow.gXs.text);
  GameData.Target._yscale = Number(Interface.BubbleWindow.gYs.text);
  GameData.Target._rotation = Number(Interface.BubbleWindow.gR.text);
  GameData.Target.Bubble._x = Number(Interface.BubbleWindow.bX.text);
  GameData.Target.Bubble._y = Number(Interface.BubbleWindow.bY.text);
  GameData.Target.Bubble._xscale = Number(Interface.BubbleWindow.bXs.text);
  GameData.Target.Bubble._yscale = Number(Interface.BubbleWindow.bYs.text);
  GameData.Target.Bubble._rotation = Number(Interface.BubbleWindow.bR.text);
  GameData.Target.D._x = Number(Interface.BubbleWindow.tX.text);
  GameData.Target.D._y = Number(Interface.BubbleWindow.tY.text);
  GameData.Target.D._rotation = Number(Interface.BubbleWindow.tR.text);
  GameData.SpeechBubbles[GameData.Target._name].XScale = Math.abs(GameData.Target.Bubble._xscale);
  if ((GameData.Target.Bubble._xscale < 0)) {
    GameData.Target.Bubble.XFace = -1;
  } else {
    GameData.Target.Bubble.XFace = 1;
  }
  GameData.SpeechBubbles[GameData.Target._name].YScale = Math.abs(GameData.Target.Bubble._yscale);
  if ((GameData.Target.Bubble._yscale < 0)) {
    GameData.Target.Bubble.YFace = -1;
  } else {
    GameData.Target.Bubble.YFace = 1;
  }
  GameData.SpeechBubbles[GameData.Target._name].Scale = Math.abs(GameData.Target._xscale);
}
<?>[Interface.BubbleWindow.Set] = "onRelease";
makeButton(Interface.BubbleWindow, "Close", "close", 152);
Interface.BubbleWindow.Close._x = 340;
Interface.BubbleWindow.Close._y = 240;
setButtonStyle(Interface.BubbleWindow.Close);
function () {
  CloseMenus(1);
}
<?>[Interface.BubbleWindow.Close] = "onRelease";
PositionMenu(Interface["Grouchy ReimuMenu"], "C", "C", 30, -20, Interface.TargetFrame, Interface.TargetFrame);
function () {
  SwapColor(this.BG, "Buttons", 1);
  playSound("Cash");
  stage["Grouchy Reimu"]._visible = false;
  CloseMenus(1);
  Target();
}
<?>[Interface["Grouchy ReimuMenu"].ID0] = "onRelease";
function () {
  SwapColor(this.BG, "Buttons", 1);
  HaxSignBE();
  CloseMenus(1);
}
<?>[Interface["Grouchy ReimuMenu"].ID1] = "onRelease";
PositionMenu(Interface["Gravity WellMenu"], "C", "C", 30, -20, Interface.TargetFrame, Interface.TargetFrame);
function () {
  SwapColor(this.BG, "Buttons", 1);
  stage["Gravity Well"]._visible = false;
  CloseMenus(1);
  Target();
}
<?>[Interface["Gravity WellMenu"].ID0] = "onRelease";
function () {
  Interface.GravMenu.Fr.text = 0;
  Interface.GravMenu.P.text = GameData.Toys["Gravity Well"].Power;
  Interface.GravMenu.sP.text = GameData.Toys["Gravity Well"].ShiftPower;
  Interface.GravMenu.cP.text = GameData.Toys["Gravity Well"].CtrlPower;
  OpenMenu(1, Interface.GravMenu, this.BG);
}
<?>[Interface["Gravity WellMenu"].ID1] = "onRelease";
PositionMenu(Interface["Boxing ChenMenu"], "C", "C", 30, -20, Interface.TargetFrame, Interface.TargetFrame);
function () {
  SwapColor(this.BG, "Buttons", 1);
  stage["Boxing Chen"]._visible = false;
  resetBoxingChen();
  CloseMenus(1);
  Target();
}
<?>[Interface["Boxing ChenMenu"].ID0] = "onRelease";
PositionMenu(Interface["Mysterious GapMenu"], "C", "C", 30, -20, Interface.TargetFrame, Interface.TargetFrame);
function () {
  SwapColor(this.BG, "Buttons", 1);
  stage["Mysterious Gap"]._visible = false;
  CloseMenus(1);
  Target();
}
<?>[Interface["Mysterious GapMenu"].ID0] = "onRelease";
PositionMenu(Interface["Clone CapsuleMenu"], "C", "C", 30, -20, Interface.TargetFrame, Interface.TargetFrame);
PositionMenu(Interface["Clone CapsuleEmptyMenu"], "C", "C", 30, -20, Interface.TargetFrame, Interface.TargetFrame);
function () {
  SwapColor(this.BG, "Buttons", 1);
  stage["Clone Capsule"]._visible = false;
  CloseMenus(1);
  Target();
}
<?>[Interface["Clone CapsuleMenu"].ID0] = "onRelease";
function () {
  SwapColor(this.BG, "Buttons", 1);
  stage["Clone Capsule"]._visible = false;
  CloseMenus(1);
  Target();
}
<?>[Interface["Clone CapsuleEmptyMenu"].ID0] = "onRelease";
function () {
  SwapColor(this.BG, "Buttons", 1);
  activateCloneCapsule();
}
<?>[Interface["Clone CapsuleMenu"].ID1] = "onRelease";
function () {
  SwapColor(this.BG, "Buttons", 1);
  ejectCloneCapsule();
  CloseMenus(1);
}
<?>[Interface["Clone CapsuleMenu"].ID2] = "onRelease";
function () {
  SwapColor(this.BG, "Buttons", 1);
  tinkerCloneCapsule();
}
<?>[Interface["Clone CapsuleMenu"].ID3] = "onRelease";
function () {
  SwapColor(this.BG, "Buttons", 1);
  showDNAstrand(GameData.Toys["Clone Capsule"].Char);
}
<?>[Interface["Clone CapsuleMenu"].ID4] = "onRelease";
function () {
  SwapColor(this.BG, "Buttons", 1);
  openDNAInput();
}
<?>[Interface["Clone CapsuleEmptyMenu"].ID1] = "onRelease";
function () {
  SwapColor(this.BG, "Buttons", 1);
  tinkerCloneCapsule();
}
<?>[Interface["Clone CapsuleEmptyMenu"].ID2] = "onRelease";
GameData.Menus.DMax = GameData.Menus.DMax + 1;
makeMenu(Interface, "LockMenu", GameData.Menus.DMax, ["Hats", "Items", "Accessory", "Back", "Shoes", "Arms", "Body", "Hair", "Eyes", "Mouth"], 85, Stage.height - 60);
PositionMenu(Interface.TargetFrame, "C", "C", 200, -5, Interface.MainMenu, Interface.MainMenu);
addPinPreview(Interface.TargetFrame);
Interface.TargetFrame._visible = false;
setButtonStyle(Interface.TargetFrame);
PositionMenu(Interface.LockMenu, "C", "C", 90, -20, Interface.TargetFrame, Interface.TargetFrame);
b = 0;
while ((b < 10)) {
  Interface.LockMenu["ID" + b].BG._width = 120;
  Interface.LockMenu["ID" + b].bName._width = 120;
  Interface.LockMenu["ID" + b].attachMovie("checkbox", "checkbox", 10);
  Interface.LockMenu["ID" + b].checkbox.gotoAndStop(1);
  Interface.LockMenu["ID" + b].checkbox._xscale = 75;
  Interface.LockMenu["ID" + b].checkbox._yscale = 75;
  Interface.LockMenu["ID" + b].checkbox._y = 10;
  Interface.LockMenu["ID" + b].checkbox._x = 110;
  function () {
    if (GameData.Characters[GameData.Target._name].Locks[this.bName.text]) {
      GameData.Characters[GameData.Target._name].Locks[this.bName.text] = false;
      this.checkbox.gotoAndStop(1);
    } else {
      GameData.Characters[GameData.Target._name].Locks[this.bName.text] = true;
      this.checkbox.gotoAndStop(2);
    }
  }
  <?>[Interface.LockMenu["ID" + b]] = "onRelease";
  b = b + 1;
}
PositionMenu(Interface.DNAMenu, "C", "C", -140, -230, Interface.TargetFrame, Interface.TargetFrame);
Interface.DNAMenu.BG._alpha = GameData.Buttons.Opacity;
makeButton(Interface.DNAMenu, "OK", "test", 50);
setButtonStyle(Interface.DNAMenu.OK);
Interface.DNAMenu.OK._x = 140;
Interface.DNAMenu.OK._y = 53;
function () {
  GameData.KeyLock = true;
}
<?>[Interface.DNAMenu.DNAdata] = "onSetFocus";
function () {
  GameData.KeyLock = false;
}
<?>[Interface.DNAMenu.DNAdata] = "onKillFocus";
makeThumbMenu(Interface.HatMenu, "Hats", "Hats", 10, 70, 20, 146, -238, "hat");
makeThumbMenu(Interface.ItemMenu, "Items", "Items", 10, 0, 20, 146, -238, "item");
makeThumbMenu(Interface.AccMenu, "Acc", "Acc", 5, 0, 20, 146, -238, "accessory");
makeThumbMenu(Interface.BackMenu, "Back", "Wings", -5, -20, 14, 146, -238, "wings");
makeThumbMenu(Interface.ShoesMenu, "Shoes", "Shoes", 20, 10, 30, 146, -238, "legs");
makeThumbMenu(Interface.ArmsMenu, "Arms", "Arms", 20, 26, 20, 146, -238, "arms");
makeThumbMenu(Interface.BodyMenu, "Body", "Body", 20, 20, 14, 146, -238, "body");
makeThumbMenu(Interface.HairMenu, "Hair", "Hair", 20, 30, 8, 146, -238, "head");
makeThumbMenu(Interface.EyesMenu, "Eyes", "Eyes", 20, 35, 15, 146, -238, "eyes");
makeThumbMenu(Interface.MouthMenu, "Mouth", "Mouth", 20, 35, 15, 146, -238, "mouth");
makeThumbMenu(Interface.ObjectList, "ObjectList", "Objects", 10, 10, 10, 64, -253, "object");
SwapColor(Interface.BGMenu.BG, "Buttons", 0);
Interface.BGMenu.BG._alpha = GameData.Buttons.Opacity;
makeThumbMenu(Interface.BGMenu, "BGs", "Background", 0, 0, 5, 100, -370, "");
Interface.BGMenu.SMod = 50;
Interface.BGMenu.Ops._x = -20;
Interface.BGMenu.DaMask._x = -20;
Interface.BGMenu.Ops._y = 50;
Interface.BGMenu.DaMask._y = 50;
Interface.BGMenu.sX.text = 100;
Interface.BGMenu.sY.text = 100;
Interface.BGMenu.Fr.text = (1 - GameData.Friction) * 100;
Interface.BGMenu.Br.text = 100;
if (GameData.BGAutoScale) {
  Interface.BGMenu.AScheck.gotoAndStop(2);
} else {
  Interface.BGMenu.AScheck.gotoAndStop(1);
}
function () {
  if (GameData.BGAutoScale) {
    GameData.BGAutoScale = false;
    Interface.BGMenu.AScheck.gotoAndStop(1);
  } else {
    GameData.BGAutoScale = true;
    Interface.BGMenu.AScheck.gotoAndStop(2);
  }
}
<?>[Interface.BGMenu.AScheck] = "onRelease";
makeButton(Interface.BGMenu, "BGSetButton", "Set", 50);
Interface.BGMenu.BGSetButton._x = 280;
Interface.BGMenu.BGSetButton._y = 270;
function () {
  setBGProperties();
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.BGMenu.BGSetButton] = "onRelease";
makeButton(Interface.BGMenu, "BGDefButton", "Default", 51);
Interface.BGMenu.BGDefButton._x = 280;
Interface.BGMenu.BGDefButton._y = 250;
function () {
  this._parent.lX.text = 0;
  this._parent.lY.text = 0;
  this._parent.sX.text = 100;
  this._parent.sY.text = 100;
  this._parent.rD.text = 0;
  this._parent.Fr.text = 10;
  this._parent.Br.text = 100;
  setBGProperties();
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.BGMenu.BGDefButton] = "onRelease";
function () {
  if ((GameData.BG - 1 < 0)) {
    SwapBG(GameData.BGs.length - 2);
  } else {
    SwapBG(GameData.BG - 1);
  }
}
<?>[Interface.BGMenu.Prev] = "onRelease";
function () {
  if ((GameData.BG + 1 > GameData.BGs.length - 2)) {
    SwapBG(0);
  } else {
    SwapBG(GameData.BG + 1);
  }
}
<?>[Interface.BGMenu.Next] = "onRelease";
PositionMenu(Interface.GravMenu, "C", "C", 140, -280, Interface.MainMenu, Interface.MainMenu);
Interface.GravMenu.BG._alpha = GameData.Buttons.Opacity;
setBGDrag(Interface.GravMenu.BG);
makeButton(Interface.GravMenu, "Close", "set", 151);
Interface.GravMenu.Close._x = 20;
Interface.GravMenu.Close._y = 110;
setButtonStyle(Interface.GravMenu.Close);
function () {
  SwapColor(this.BG, "Buttons", 1);
  GameData.Toys["Gravity Well"].Friction = getFriction(Number(this._parent.Fr.text));
  GameData.Toys["Gravity Well"].Power = Number(this._parent.P.text);
  GameData.Toys["Gravity Well"].ShiftPower = Number(this._parent.sP.text);
  GameData.Toys["Gravity Well"].CtrlPower = Number(this._parent.cP.text);
  CloseMenus(1);
}
<?>[Interface.GravMenu.Close] = "onRelease";
PositionMenu(Interface.COMenu, "C", "C", -100, -350, Interface.TargetFrame, Interface.TargetFrame);
Interface.COMenu.BG._alpha = GameData.Buttons.Opacity;
function () {
  this._parent.startDrag();
}
<?>[Interface.COMenu.BG] = "onPress";
function () {
  this._parent.stopDrag();
}
<?>[Interface.COMenu.BG] = "onRelease";
function () {
  this._parent.stopDrag();
}
<?>[Interface.COMenu.BG] = "onReleaseOutside";
function () {
  GameData.KeyLock = true;
}
<?>[Interface.COMenu.cName] = "onSetFocus";
function () {
  GameData.KeyLock = false;
}
<?>[Interface.COMenu.cName] = "onKillFocus";
function () {
  QuickSwap(GameData.Target, -1, "All");
  setCharLook(this._parent.char, GameData.Characters[GameData.Target._name]);
}
<?>[Interface.COMenu.Prev] = "onRelease";
function () {
  QuickSwap(GameData.Target, 1, "All");
  setCharLook(this._parent.char, GameData.Characters[GameData.Target._name]);
}
<?>[Interface.COMenu.Next] = "onRelease";
GameData.PartsArray = new Array("Hats", "Eyes", "Mouth", "Hair", "Body", "Arms", "Shoes", "Back", "Accessory", "Items");
i = 0;
while ((i < GameData.PartsArray.length)) {
  Interface.COMenu.attachMovie("Arrow", "Prev" + i, i * 3);
  Interface.COMenu["Prev" + i]._xscale = 35;
  Interface.COMenu["Prev" + i]._yscale = 35;
  Interface.COMenu["Prev" + i]._y = i * 21 + 9;
  Interface.COMenu["Prev" + i]._x = 250;
  Interface.COMenu["Prev" + i].ID = GameData.PartsArray[i];
  function () {
    QuickSwap(GameData.Target, -1, this.ID);
    setCharLook(this._parent.char, GameData.Characters[GameData.Target._name]);
  }
  <?>[Interface.COMenu["Prev" + i]] = "onRelease";
  Interface.COMenu.attachMovie("Arrow", "Next" + i, i * 3 + 2);
  Interface.COMenu["Next" + i]._xscale = -35;
  Interface.COMenu["Next" + i]._yscale = 35;
  Interface.COMenu["Next" + i]._y = i * 21 + 9;
  Interface.COMenu["Next" + i]._x = 385;
  Interface.COMenu["Next" + i].ID = GameData.PartsArray[i];
  function () {
    QuickSwap(GameData.Target, 1, this.ID);
    setCharLook(this._parent.char, GameData.Characters[GameData.Target._name]);
  }
  <?>[Interface.COMenu["Next" + i]] = "onRelease";
  Interface.COMenu.attachMovie("checkbox", "Lock" + i, i * 3 + 1);
  Interface.COMenu["Lock" + i]._xscale = 75;
  Interface.COMenu["Lock" + i]._yscale = 75;
  Interface.COMenu["Lock" + i]._y = i * 21 + 17;
  Interface.COMenu["Lock" + i]._x = 363;
  Interface.COMenu["Lock" + i].ID = GameData.PartsArray[i];
  Interface.COMenu["Lock" + i].IDnum = i;
  function () {
    if (GameData.Characters[GameData.Target._name].Locks[this.ID]) {
      GameData.Characters[GameData.Target._name].Locks[this.ID] = false;
      this._parent["Prev" + this.IDnum]._visible = true;
      this._parent["Next" + this.IDnum]._visible = true;
      this.gotoAndStop(1);
    } else {
      GameData.Characters[GameData.Target._name].Locks[this.ID] = true;
      this._parent["Prev" + this.IDnum]._visible = false;
      this._parent["Next" + this.IDnum]._visible = false;
      this.gotoAndStop(2);
    }
  }
  <?>[Interface.COMenu["Lock" + i]] = "onRelease";
  i = i + 1;
}
makeButton(Interface.COMenu, "Set", "set", 150);
Interface.COMenu.Set._x = 140;
Interface.COMenu.Set._y = 250;
setButtonStyle(Interface.COMenu.Set);
function () {
  SwapColor(this.BG, "Buttons", 1);
  GameData.Characters[GameData.Target._name].Name = Interface.COMenu.cName.text;
  Interface.TargetFrame.bName.text = Interface.COMenu.cName.text;
  if ((Interface.COMenu.cScale.text < GameData.ScaleLimit)) {
    Interface.COMenu.cScale.text = GameData.ScaleLimit;
  }
  GameData.Characters[GameData.Target._name].Scale = Number(Interface.COMenu.cScale.text);
  GameData.Target._xscale = GameData.Characters[GameData.Target._name].Scale * GameData.Target.XFace;
  GameData.Target._yscale = GameData.Characters[GameData.Target._name].Scale * GameData.Target.YFace;
  GameData.Target._rotation = Interface.COMenu.cRot.text;
  GameData.Target._x = Interface.COMenu.cX.text;
  GameData.Target._y = Interface.COMenu.cY.text;
}
<?>[Interface.COMenu.Set] = "onRelease";
makeButton(Interface.COMenu, "Close", "close", 151);
Interface.COMenu.Close._x = -20;
Interface.COMenu.Close._y = 250;
setButtonStyle(Interface.COMenu.Close);
function () {
  SwapColor(this.BG, "Buttons", 1);
  CloseMenus(1);
}
<?>[Interface.COMenu.Close] = "onRelease";
makeMenu(Interface.COMenu, "SideOps", 152, ["Bring Forward", "Send Backwards", "Vertical Flip", "Horizontal Flip", "Unlock All", "Lock All", "Randomize"], 0, 0);
Interface.COMenu.SideOps._x = -20;
Interface.COMenu.SideOps._y = 170;
Interface.COMenu.SideOps._visible = true;
function () {
  BringForward(GameData.Target);
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.COMenu.SideOps.ID0] = "onRelease";
function () {
  SendBackward(GameData.Target);
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.COMenu.SideOps.ID1] = "onRelease";
function () {
  GameData.Target._yscale = GameData.Target._yscale * -1;
  GameData.Target.YFace = GameData.Target.YFace * -1;
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.COMenu.SideOps.ID2] = "onRelease";
function () {
  GameData.Target._xscale = GameData.Target._xscale * -1;
  GameData.Target.XFace = GameData.Target.XFace * -1;
  SwapColor(this.BG, "Buttons", 1);
}
<?>[Interface.COMenu.SideOps.ID3] = "onRelease";
function () {
  i = 0;
  while ((i < GameData.PartsArray.length)) {
    GameData.Characters[GameData.Target._name].Locks[GameData.PartsArray[i]] = false;
    Interface.COMenu["Prev" + i]._visible = true;
    Interface.COMenu["Next" + i]._visible = true;
    Interface.COMenu["Lock" + i].gotoAndStop(1);
    i = i + 1;
  }
}
<?>[Interface.COMenu.SideOps.ID4] = "onRelease";
function () {
  i = 0;
  while ((i < GameData.PartsArray.length)) {
    GameData.Characters[GameData.Target._name].Locks[GameData.PartsArray[i]] = true;
    Interface.COMenu["Prev" + i]._visible = false;
    Interface.COMenu["Next" + i]._visible = false;
    Interface.COMenu["Lock" + i].gotoAndStop(2);
    i = i + 1;
  }
}
<?>[Interface.COMenu.SideOps.ID5] = "onRelease";
function () {
  RandomizeAll(GameData.Target);
  setCharLook(Interface.COMenu.char, GameData.Characters[GameData.Target._name]);
}
<?>[Interface.COMenu.SideOps.ID6] = "onRelease";
setKeyLocks(Interface.COMenu.cName);
setKeyLocks(Interface.COMenu.cScale);
setKeyLocks(Interface.COMenu.cRot);
setKeyLocks(Interface.COMenu.cX);
setKeyLocks(Interface.COMenu.cY);
PositionMenu(Interface.RenameMenu, "C", "C", 0, -200, Interface.TargetFrame, Interface.TargetFrame);
Interface.RenameMenu.BG._alpha = GameData.Buttons.Opacity;
makeButton(Interface.RenameMenu, "OK", "OK", 10);
Interface.RenameMenu.OK._x = 50;
Interface.RenameMenu.OK._y = 35;
function () {
  GameData.KeyLock = true;
}
<?>[Interface.RenameMenu.iName] = "onSetFocus";
function () {
  GameData.KeyLock = false;
}
<?>[Interface.RenameMenu.iName] = "onKillFocus";
makeButton(Interface.ConfirmBox, "OK", "OK", 10);
Interface.ConfirmBox.OK._x = 30;
Interface.ConfirmBox.OK._y = 35;
makeButton(Interface.ConfirmBox, "Cancel", "Cancel", 11);
Interface.ConfirmBox.Cancel._x = 170;
Interface.ConfirmBox.Cancel._y = 35;
fixScales();
setMenuPositions();
GameData.Menus.baseH = Interface._height;
GameData.Menus.baseW = Interface._width;
function () {
  SetMenu(1, "MainMenu", this, 0, 0);
}
<?>[Interface.MainMenu] = "onRelease";
function () {
  SetMenu(1, "SceneMenu", this, 0, 0);
}
<?>[Interface.SceneFrame] = "onRelease";
fixMenuDepths(["BGMenu", "HatMenu", "EyesMenu", "BodyMenu", "ShoesMenu", "ArmsMenu", "AccMenu", "ItemMenu", "HairMenu", "BackMenu", "MouthMenu", "ObjectList", "RenameMenu", "HelpWindow", "BubbleWindow"]);
Interface.TargetFrame.BG._width = 170;
Interface.TargetFrame.bName._width = 170 - Interface.TargetFrame.bName._x;
Interface.TargetFrame.attachMovie("TargetFramePreview", "preview", 10);
Interface.TargetFrame.preview._x = 10;
Interface.TargetFrame.preview._y = 10;
Interface.TargetFrame.preview._xscale = 40;
Interface.TargetFrame.preview._yscale = 40;
if (!(my_so.data.Version < GameData.Version)) {
  my_so.data.Version < GameData.Version;
}
if ((my_so.data.Version == undefined)) {
  GameData.Menus.Functions.OpenHelp();
  Interface.HelpWindow.BasicHelpMenu._visible = false;
  playSound("Pop");
  Interface.HelpWindow.Next._visible = true;
  SwapColor(this.BG, "Buttons", 1);
  Interface.HelpWindow.EirinTalk.D.text = GameData.Help.Updates;
  function () {
    resetHelp();
  }
  <?>[Interface.HelpWindow.Next] = "onRelease";
  my_so.data.Version = GameData.Version;
  my_so.flush();
}
GameData.Windows.New();
GameData.Pong.Top = 50;
GameData.Pong.Bottom = 360;