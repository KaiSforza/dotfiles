/* See LICENSE file for copyright and license details.
   William Giokas's dwm config.h */

/* appearance {{{ */
static const char font[]            = "-windows-proggyoptis-medium-r-normal--10-80-96-96-c-60-iso8859-1";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 10;       /* snap pixel */
static const unsigned int systrayspacing = 0;   /* systray spacing */
static const Bool showsystray       = True;     /* False means no systray */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = False;    /* False means bottom bar */
#define NUMCOLORS                     8         /* Number of colors */
static const char colors[NUMCOLORS][ColLast][8] = {
  // border   foreground background
  { "#333333", "#dddddd", "#000000" },  // x01 normal
  { "#4c7899", "#eeeeee", "#333333" },  // x02 selected
  { "#ff0000", "#000000", "#ffff00" },  // x03 urgent/warning (black on yellow)
  { "#ff0000", "#ffffff", "#ff0000" },  // x04 error (white on red)
  { "#ff0000", "#000000", "#6cb100" },  // x05 black on green
  { "#ff0000", "#7ccc00", "#000000" },  // x06 green on black
  { "#ff0000", "#ff0000", "#000000" },  // x07 red on black
  { "#ff0000", "#ffff00", "#000000" },  // x08 yellow on black
};/*}}}*/

/* tags {{{
 * 1: terms
 * 2: browser
 * 3: images/comics
 * 4: documents
 * 5: everything else */
static const char *tags[] = { "trm", "www", "img", "doc", "msc" };

static const Rule rules[] = {
    /* class      instance    title           tags mask  isfloating  monitor */
    { NULL,       NULL,       NULL,                0,       False,       -1 },
    { "URxvt",    NULL,       "scustatus",         0,       True,        -1 },
    { "URxvt",    NULL,       "presenting",   1 << 3,       False,       1  },
    /* browsers */
    { "Dwb",      NULL,       NULL,           1 << 1,       False,       -1 },
    { "URxvt",    NULL,       "download_dwb", 1 << 1,       True,        -1 },
    { "luakit",   NULL,       NULL,           1 << 1,       False,       -1 },
    { "Firefox",  NULL,       NULL,           1 << 1,       False,       -1 },
    /* miscelaneous */
    { "Gimp",     NULL,       NULL,           1 << 2,       False,       -1 },
    { "Mcomix",   NULL,       NULL,           1 << 2,       False,       -1 },
    { "Zathura",  NULL,       NULL,           1 << 3,       False,       -1 },
    { "Abiword",  NULL,       NULL,           1 << 3,       False,       -1 },
    { "libreoffice",  NULL,   NULL,           1 << 3,       False,       -1 },
    { "mpv",      NULL,       NULL,           1 << 2,       True,        -1 },
    { NULL,       NULL,       "Steam",        1 << 4,       True,        -1 },
    { "Steam",    NULL,       NULL,           1 << 4,       True,        -1 },
    { "Gvbam",    NULL,       NULL,           1 << 4,       True,        -1 },
    { "Display",  NULL,       NULL,                0,       True,        -1 },
};/*}}}*/

/* layout(s) *//*{{{*/
static const float mfact      = 0.60; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals *//*}}}*/

static const Layout layouts[] = {/*{{{*/
    /* symbol     arrange function */
    { "",         deck },
    { "[]-",      tile },    /* first entry is default */
    { "><>",      NULL },    /* no layout function means floating behavior */
    { "[M]",      monocle },
};/*}}}*/

/* key definitions *//*{{{*/
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },/*}}}*/

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/zsh", "-c", cmd, NULL } }

/* commands *//*{{{*/
/* dmenu *//*{{{*/
static const char *dmenucmd[]    = { "dmenu_run", "-fn", font, "-nb",
    colors[0][2], "-nf", colors[0][1], "-sb", colors[1][2], "-sf",
    colors[1][1], "-p", "/home/wgiokas", NULL };
static const char *scucmd[]      = { "scudmenu", NULL };/*}}}*/

/* Spawning windows *//*{{{*/
static const char *termcmd[]        = { "urxvtc", NULL };
static const char *dwbcmd[]         = { "systemctl", "--user", "start", "dwb",     NULL};
static const char *luakitcmd[]      = { "systemctl", "--user", "start", "luakit",  NULL};
static const char *mcomixcmd[]      = { "systemctl", "--user", "start", "mcomix",  NULL};
static const char *zathuracmd[]     = { "systemctl", "--user", "start", "zathura", NULL};/*}}}*/

/* Systemd --user stuff *//*{{{*/
static const char *killcmd[]        = { "systemctl", "--user", "exit",                  NULL };
static const char *restartcmd[]     = { "systemctl", "--user", "restart", "dwm",        NULL };
static const char *barrestartcmd[]  = { "systemctl", "--user", "restart", "dwmstatus-ks", NULL };/*}}}*//*}}}*/


static Key keys[] = {/*{{{*/
    /* modifier                     key        function        argument */
    { MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
    { MODKEY|ShiftMask,             XK_d,      spawn,          {.v = scucmd } },
    { MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
    { MODKEY|ShiftMask,             XK_e,      spawn,          {.v = killcmd } },
    { MODKEY|ShiftMask,             XK_r,      spawn,          {.v = restartcmd } },
    { MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
    { MODKEY,                       XK_v,      togglebar,      {0} },
    { MODKEY|ShiftMask,             XK_v,      spawn,          {.v = barrestartcmd } },
    { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
    { MODKEY,                       XK_u,      incnmaster,     {.i = +1 } },
    { MODKEY,                       XK_i,      incnmaster,     {.i = -1 } },
    /* Resize main window left and right                                */
    { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
    /* Move window into master position                                 */
    { MODKEY,                       XK_Return, zoom,           {0} },
    { MODKEY,                       XK_Tab,    view,           {0} },
    /* Layout Keys:                                                     */
    { MODKEY,                       XK_e,      setlayout,      {.v = &layouts[1]} },
    { MODKEY,                       XK_w,      setlayout,      {.v = &layouts[2]} },
    { MODKEY,                       XK_s,      setlayout,      {.v = &layouts[3]} },
    { MODKEY,                       XK_r,      setlayout,      {.v = &layouts[0]} },
    { MODKEY,                       XK_space,  setlayout,      {0} },
    { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
    /* See all tags
    { MODKEY,                       XK_0,      view,           {.ui = ~0 } },*/
    { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
    { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
    { MODKEY,                       XK_period, focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
    /* Systemd user unit hotkeys                                        */
    { MODKEY|ShiftMask,             XK_n,      spawn,          {.v = luakitcmd } },
    { MODKEY|ShiftMask,             XK_b,      spawn,          {.v = dwbcmd } },
    { MODKEY|ShiftMask,             XK_m,      spawn,          {.v = mcomixcmd } },
    { MODKEY|ShiftMask,             XK_z,      spawn,          {.v = zathuracmd } },
    /* Workspace Tags                                                   */
    TAGKEYS(                        XK_1,                      0)
    TAGKEYS(                        XK_2,                      1)
    TAGKEYS(                        XK_3,                      2)
    TAGKEYS(                        XK_4,                      3)
    TAGKEYS(                        XK_5,                      4)
    /*TAGKEYS(                        XK_6,                      5)
    TAGKEYS(                        XK_7,                      6)
    TAGKEYS(                        XK_8,                      7)
    TAGKEYS(                        XK_9,                      8)*/
};/*}}}*/

static Button buttons[] = {/*{{{*/
    /* button definitions */
    /* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
    /* click                event mask      button          function        argument */
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};/*}}}*/
