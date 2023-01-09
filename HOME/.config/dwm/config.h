#include <stddef.h>
#include <X11/XF86keysym.h>
#include <X11/keysym.h>
/* See LICENSE file for copyright and license details. */

// dwm - config.h

// > Appearence
static const int bar_height              = 28;// height of bar
static const int focusonwheel            = 0; // focus once you scroll; 1 or 0
static const int showbar                 = 1;
static const int smartgaps_fact          = 1;
static const int swallowfloating         = 0; // swallow floating windows? 1 or 0
static const int topbar                  = 1; // 1 = bar on top; 0 = bar on bottom
static const unsigned int borderpx       = 3;
static const unsigned int gappih         = 8; // gap inner horizontal
static const unsigned int gappiv         = 8; // gap innver vertical
static const unsigned int gappoh         = 10; // gap outer horizontal
static const unsigned int gappov         = 10; // gap outer vertical
static const unsigned int snap           = 16;

static const unsigned int systrayspacing = 4; // systray spacing
static const int showsystray             = 1;

// >> Indicators
// See patch/bar_indicators.h for options
static int tagindicatortype              = INDICATOR_BOTTOM_BAR;
static int tiledindicatortype            = INDICATOR_NONE;
static int floatindicatortype            = INDICATOR_TOP_LEFT_SQUARE;
static const char *fonts[]               = { "Jetbrains\\ Mono:size=8", "Noto\\ Color\\ Emoji:pixelsize=16:style=Regular" };
static const char dmenufont[]            = "Jetbrains\\ Mono:size=8";

// >> Colors
// Everforest dark hard
static char c0[] = "#000000"; 

static char bg_dim[] = "#1e2326";
static char bg0[] = "#272e33";
static char bg1[] = "#2e383c";
static char bg2[] = "#374145";
static char bg3[] = "#414b50";
static char bg4[] = "#495156";

static char bg_visual[] = "#4c3743";
static char bg_red[] = "#493b40";
static char bg_green[] = "#3c4841";
static char bg_blue[] = "#384b55";
static char bg_yellow[] = "#45443c";

static char fg[] = "#d3c6aa";

static char red[] = "#e67e80";
static char orange[] = "#e69875";
static char yellow[] = "#dbbc7f";
static char green[] = "#a7c080";
static char aqua[] = "#83c092";
static char blue[] = "#7fbbb3";
static char purple[] = "#d699b6";

static char grey0[] = "#7a8478";
static char grey1[] = "#859289";
static char grey2[] = "#9da9a0";

static char *colors[][ColCount] = {
	/*                       fg  bg         border   float */
	[SchemeNorm]         = { fg, bg_dim,    bg_red,    bg_red },
	[SchemeSel]          = { fg, bg2,       red,       red },
	[SchemeTitleNorm]    = { fg, bg1,       bg0,       bg0 },
	[SchemeTitleSel]     = { fg, bg1,       bg1,       bg1 },
	[SchemeTagsNorm]     = { fg, bg_dim,    bg0,       bg0 },
	[SchemeTagsSel]      = { fg, bg2,       bg1,       bg1 },
	[SchemeHidNorm]      = { fg, bg1,       c0,        c0 },
	[SchemeHidSel]       = { fg, bg3,       c0,        c0 },
	[SchemeUrg]          = { fg, bg_visual, bg_visual, bg_visual },
};


static const char *const autostart[] = {
	"dwmblocks", NULL,
	"sh", "-c", "$HOME/.config/dwm/autostart.sh", NULL,
	NULL
};


/* > Tags
 * In a traditional dwm the number of tags in use can be changed simply by changing the number
 * of strings in the tags array. This build does things a bit different which has some added
 * benefits. If you need to change the number of tags here then change the NUMTAGS macro in dwm.c.
 *
 * Examples:
 *
 *  1) static char *tagicons[][NUMTAGS*2] = {
 *         [DEFAULT_TAGS] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I" },
 *     }
 *
 *  2) static char *tagicons[][1] = {
 *         [DEFAULT_TAGS] = { "•" },
 *     }
 */
static char *tagicons[][NUMTAGS] = {
	[DEFAULT_TAGS]        = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
	[ALTERNATIVE_TAGS]    = { "A", "B", "C", "D", "E", "F", "G", "H", "I" },
	//[ALT_TAGS_DECORATION] = { "<1>" },
};


// > Window rules
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 *	WM_WINDOW_ROLE(STRING) = role
	 *	_NET_WM_WINDOW_TYPE(ATOM) = wintype
	 */
	/*------------------------------------------------------------------------------*/
	/* class  instance  title  tagsmask  isfloating  isterminal  noswallow  monitor */
	/*------------------------------------------------------------------------------*/
	RULE(.wintype = WTYPE "DIALOG", .isfloating = 1)
	RULE(.wintype = WTYPE "UTILITY", .isfloating = 1)
	RULE(.wintype = WTYPE "TOOLBAR", .isfloating = 1)
	RULE(.wintype = WTYPE "SPLASH", .isfloating = 1)
	RULE(.class = "Gimp", .tags = 1 << 4)
	RULE(.class = "Firefox", .tags = 1 << 7)
	RULE(.class = "Alacritty", .isterminal = 1)
	RULE(.class = "kitty", .isterminal = 1)
	RULE(.class = "st", .isterminal = 1)
	RULE(.title = "Event Tester", .noswallow = 1)
};


// > Bar rules
// -1: show on all monitors.
// 0: show on current monitor.
// 'A': show on active monitor.
static const BarRule barrules[] = {
	/* monitor   bar    alignment         widthfunc                drawfunc                clickfunc                name */
	{ -1,        0,     BAR_ALIGN_LEFT,   width_tags,              draw_tags,              click_tags,              "tags" },
	{  0,        0,     BAR_ALIGN_RIGHT,  width_systray,           draw_systray,           click_systray,           "systray" },
	{ -1,        0,     BAR_ALIGN_LEFT,   width_ltsymbol,          draw_ltsymbol,          click_ltsymbol,          "layout" },
	{ 'A',       0,     BAR_ALIGN_RIGHT,  width_status,            draw_status,            click_status,            "status" },
	{ -1,        0,     BAR_ALIGN_NONE,   width_wintitle,          draw_wintitle,          click_wintitle,          "wintitle" },
};

// > Layouts
static const float mfact     = 0.51; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int nstack      = 0;    /* number of clients in primary stack area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int decorhints  = 1;    /* 1 means respect decoration hints */

static const int layoutaxis[] = {
	1,    /* layout axis: 1 = x, 2 = y; negative values mirror the layout, setting the master area to the right / bottom instead of left / top */
	2,    /* master axis: 1 = x (from left to right), 2 = y (from top to bottom), 3 = z (monocle) */
	2,    /* stack axis:  1 = x (from left to right), 2 = y (from top to bottom), 3 = z (monocle) */
};

static const Layout layouts[] = {
	/* symbol     arrange function, { nmaster, nstack, layout, master axis, stack axis, secondary stack axis, symbol func } */
	{ "[\\]",     flextile,         { -1, -1, NO_SPLIT, DWINDLE, DWINDLE, 0, NULL } }, // fibonacci dwindle
	{ "[]=",      flextile,         { -1, -1, SPLIT_VERTICAL, TOP_TO_BOTTOM, TOP_TO_BOTTOM, 0, NULL } }, // default tile layout
 	{ "><>",      NULL,             {0} }, // floating
	{ "[M]",      flextile,         { -1, -1, NO_SPLIT, MONOCLE, MONOCLE, 0, NULL } }, // monocle
	{ "|||",      flextile,         { -1, -1, SPLIT_VERTICAL, LEFT_TO_RIGHT, TOP_TO_BOTTOM, 0, NULL } }, // columns layout
	{ ">M>",      flextile,         { -1, -1, FLOATING_MASTER, LEFT_TO_RIGHT, LEFT_TO_RIGHT, 0, NULL } }, // floating master
	{ "[D]",      flextile,         { -1, -1, SPLIT_VERTICAL, TOP_TO_BOTTOM, MONOCLE, 0, NULL } }, // deck
	{ "TTT",      flextile,         { -1, -1, SPLIT_HORIZONTAL, LEFT_TO_RIGHT, LEFT_TO_RIGHT, 0, NULL } }, // bstack
	{ "===",      flextile,         { -1, -1, SPLIT_HORIZONTAL, LEFT_TO_RIGHT, TOP_TO_BOTTOM, 0, NULL } }, // bstackhoriz
	{ "|M|",      flextile,         { -1, -1, SPLIT_CENTERED_VERTICAL, LEFT_TO_RIGHT, TOP_TO_BOTTOM, TOP_TO_BOTTOM, NULL } }, // centeredmaster
	{ "-M-",      flextile,         { -1, -1, SPLIT_CENTERED_HORIZONTAL, TOP_TO_BOTTOM, LEFT_TO_RIGHT, LEFT_TO_RIGHT, NULL } }, // centeredmaster horiz
	{ ":::",      flextile,         { -1, -1, NO_SPLIT, GAPPLESSGRID, GAPPLESSGRID, 0, NULL } }, // gappless grid
	{ "(@)",      flextile,         { -1, -1, NO_SPLIT, SPIRAL, SPIRAL, 0, NULL } }, // fibonacci spiral
	{ "[T]",      flextile,         { -1, -1, SPLIT_VERTICAL, LEFT_TO_RIGHT, TATAMI, 0, NULL } }, // tatami mats
	{ NULL, NULL, {0} },
	//{ "[]=",      tile,             {0} },
	//{ "[M]",      monocle,          {0} }, // non-flextile layouts
};


// Key definitions
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

// > Commands
// >> Dmenu
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
	"dmenu_run",
	"-m", dmenumon,
	"-fn", dmenufont,
	"-nb", bg_dim,
	"-nf", fg,
	"-sb", bg2,
	"-sf", fg,
	NULL
};

static const char *terminal[] = { "kitty", NULL };
static const char *web_browser[] = { "librewolf", NULL};
static const char *file_manager[] = { "kitty", "lf", NULL };

// >> Screenshot utilities
static const char *select_screenshot[] = { "sh", "-c", "maim -s -u | xclip -selection clipboard -t image/png", NULL};
static const char *screenshot[] = { "sh", "-c", "maim | xclip -selection clipboard -t image/png", NULL };

// >> Rofi
static const char *rofi_run[] = { "rofi", "-show", "run", "-show-icons", NULL };
static const char *rofi_drun[] = { "rofi", "-show", "drun", "-show-icons", NULL };
static const char *rofi_emoji[] = { "rofi", "-show", "emoji", NULL };

// >> Volume control
static const char *raise_vol[] = { "sh", "-c", "pamixer -i5; kill -44 $(pidof dwmblocks)", NULL };
static const char *lower_vol[] = { "sh", "-c", "pamixer -d5; kill -44 $(pidof dwmblocks)", NULL };
static const char *mute_vol[] = { "sh", "-c", "pamixer -t;  kill -44 $(pidof dwmblocks)", NULL };

// >> Brightness controll
static const char *raise_br[] = { "brightnessctl", "s", "5%+", NULL };
static const char *lower_br[] = { "brightnessctl", "s", "5%-", NULL };

// > Keybinds
static Key keys[] = {
	/* modifier                     key            function                argument */
	
	// controls
	{ 0,                            XF86XK_AudioRaiseVolume,  spawn,        {.v = raise_vol} },
	{ 0,                            XF86XK_AudioLowerVolume,  spawn,        {.v = lower_vol} },
	{ 0,                            XF86XK_AudioMute,         spawn,        {.v = mute_vol } },
	{ 0,                            XF86XK_MonBrightnessUp,   spawn,        {.v = raise_br } },
	{ 0,                            XF86XK_MonBrightnessDown, spawn,        {.v = lower_br } },

	{ MODKEY,                       XK_p,          spawn,                  {.v = dmenucmd } },
	{ MODKEY,		                XK_Return,     spawn,                  {.v = terminal } },
	{ MODKEY,                       XK_f,          spawn,                  {.v = web_browser } },
	{ MODKEY|ShiftMask,             XK_Return,     spawn,                  {.v = file_manager } },
	{ MODKEY|ShiftMask,             XK_z,          spawn,                  {.v = screenshot } },
	{ MODKEY|ShiftMask,             XK_s,          spawn,                  {.v = select_screenshot } },

	// Rofi
	{ MODKEY|ControlMask,           XK_d,          spawn,                  {.v = rofi_run } },
	{ MODKEY|ShiftMask,             XK_d,          spawn,                  {.v = rofi_drun } },
	{ MODKEY,                       XK_period,     spawn,                  {.v = rofi_emoji } },
	
	{ MODKEY,                       XK_b,          togglebar,              {0} },

	// Layouts
	{ MODKEY|ControlMask,           XK_space,      focusmaster,            {0} },
	{ MODKEY|ShiftMask,             XK_j,          rotatestack,            {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,          rotatestack,            {.i = -1 } },
	{ MODKEY,                       XK_j,          focusstack,             {.i = +1 } },
	{ MODKEY,                       XK_k,          focusstack,             {.i = -1 } },
	{ MODKEY,                       XK_i,          incnmaster,             {.i = +1 } },
	{ MODKEY,                       XK_d,          incnmaster,             {.i = -1 } },
	{ MODKEY,                       XK_h,          setmfact,               {.f = -0.05} },
	{ MODKEY,                       XK_l,          setmfact,               {.f = +0.05} },
	
	{ MODKEY|ControlMask,           XK_t,          rotatelayoutaxis,       {.i = +1 } },   /* flextile, 1 = layout axis */
	{ MODKEY|ControlMask,           XK_Tab,        rotatelayoutaxis,       {.i = +2 } },   /* flextile, 2 = master axis */
	{ MODKEY|ControlMask|ShiftMask, XK_Tab,        rotatelayoutaxis,       {.i = +3 } },   /* flextile, 3 = stack axis */
	{ MODKEY|ControlMask|Mod1Mask,  XK_Tab,        rotatelayoutaxis,       {.i = +4 } },   /* flextile, 4 = secondary stack axis */
	{ MODKEY|Mod5Mask,              XK_t,          rotatelayoutaxis,       {.i = -1 } },   /* flextile, 1 = layout axis */
	{ MODKEY|Mod5Mask,              XK_Tab,        rotatelayoutaxis,       {.i = -2 } },   /* flextile, 2 = master axis */
	{ MODKEY|Mod5Mask|ShiftMask,    XK_Tab,        rotatelayoutaxis,       {.i = -3 } },   /* flextile, 3 = stack axis */
	{ MODKEY|Mod5Mask|Mod1Mask,     XK_Tab,        rotatelayoutaxis,       {.i = -4 } },   /* flextile, 4 = secondary stack axis */
	{ MODKEY|ControlMask,           XK_Return,     mirrorlayout,           {0} },          /* flextile, flip master and stack areas */
	
	// Gaps
	{ MODKEY|Mod1Mask,              XK_u,          incrgaps,               {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_u,          incrgaps,               {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_i,          incrigaps,              {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_i,          incrigaps,              {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_o,          incrogaps,              {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_o,          incrogaps,              {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_6,          incrihgaps,             {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_6,          incrihgaps,             {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_7,          incrivgaps,             {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_7,          incrivgaps,             {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_8,          incrohgaps,             {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_8,          incrohgaps,             {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_9,          incrovgaps,             {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_9,          incrovgaps,             {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_0,          togglegaps,             {0} },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_0,          defaultgaps,            {0} },
	
	{ MODKEY,                       XK_Tab,        view,                   {0} },
	{ MODKEY|ShiftMask,             XK_q,          killclient,             {0} },
	{ MODKEY|ShiftMask,             XK_e,          quit,                   {0} },
	
	// Set a layout.
	{ MODKEY,                       XK_t,          setlayout,              {.v = &layouts[1]} },
	{ MODKEY|ControlMask,           XK_f,          setlayout,              {.v = &layouts[2]} },
	{ MODKEY,                       XK_m,          setlayout,              {.v = &layouts[3]} },
	{ MODKEY|ControlMask,           XK_w,          setlayout,              {.v = &layouts[4]} },
	{ MODKEY|ControlMask|ShiftMask, XK_w,          setlayout,              {.v = &layouts[8]} },
	{ MODKEY|ShiftMask,             XK_t,          setlayout,              {.v = &layouts[7]} },
	{ MODKEY,                       XK_s,          setlayout,              {.v = &layouts[0]}},
	{ MODKEY,                       XK_space,      setlayout,              {0} },

	{ MODKEY|ShiftMask,             XK_space,      togglefloating,         {0} },
	{ MODKEY,                       XK_0,          view,                   {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,          tag,                    {.ui = ~0 } },
	{ MODKEY,                       XK_comma,      focusmon,               {.i = -1 } },
	{ MODKEY,                       XK_period,     focusmon,               {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,      tagmon,                 {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,     tagmon,                 {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_f,          togglefullscreen,  {0} },

	// Cycle the layout.
	{ MODKEY|ControlMask,           XK_comma,      cyclelayout,            {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period,     cyclelayout,            {.i = +1 } },

	TAGKEYS(XK_1, 0)
	TAGKEYS(XK_2, 1)
	TAGKEYS(XK_3, 2)
	TAGKEYS(XK_4, 3)
	TAGKEYS(XK_5, 4)
	TAGKEYS(XK_6, 5)
	TAGKEYS(XK_7, 6)
	TAGKEYS(XK_8, 7)
	TAGKEYS(XK_9, 8)
};


// > Mouse buttons
// click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin
static Button buttons[] = {
	/* click                event mask           button          function        argument */
	{ ClkLtSymbol,          0,                   Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,                   Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,                   Button2,        zoom,           {0} },
	{ ClkStatusText,        0,                   Button2,        spawn,          {.v = terminal } },
	{ ClkClientWin,         MODKEY,              Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,              Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,              Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,                   Button1,        view,           {0} },
	{ ClkTagBar,            0,                   Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,              Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,              Button3,        toggletag,      {0} },
};
