const sdl = @import("bindings");

pub const Keycode = enum(sdl.SDL_Keycode) {
    Unknown = sdl.SDLK_UNKNOWN,
    Return = sdl.SDLK_RETURN,
    Escape = sdl.SDLK_ESCAPE,
    Backspace = sdl.SDLK_BACKSPACE,
    Tab = sdl.SDLK_TAB,
    Space = sdl.SDLK_SPACE,
    Exclaim = sdl.SDLK_EXCLAIM,
    Quotedbl = sdl.SDLK_QUOTEDBL,
    Hash = sdl.SDLK_HASH,
    Percent = sdl.SDLK_PERCENT,
    Dollar = sdl.SDLK_DOLLAR,
    Ampersand = sdl.SDLK_AMPERSAND,
    Quote = sdl.SDLK_QUOTE,
    Leftparen = sdl.SDLK_LEFTPAREN,
    Rightparen = sdl.SDLK_RIGHTPAREN,
    Asterisk = sdl.SDLK_ASTERISK,
    Plus = sdl.SDLK_PLUS,
    Comma = sdl.SDLK_COMMA,
    Minus = sdl.SDLK_MINUS,
    Period = sdl.SDLK_PERIOD,
    Slash = sdl.SDLK_SLASH,
    @"0" = sdl.SDLK_0,
    @"1" = sdl.SDLK_1,
    @"2" = sdl.SDLK_2,
    @"3" = sdl.SDLK_3,
    @"4" = sdl.SDLK_4,
    @"5" = sdl.SDLK_5,
    @"6" = sdl.SDLK_6,
    @"7" = sdl.SDLK_7,
    @"8" = sdl.SDLK_8,
    @"9" = sdl.SDLK_9,
    Colon = sdl.SDLK_COLON,
    Semicolon = sdl.SDLK_SEMICOLON,
    Less = sdl.SDLK_LESS,
    Equals = sdl.SDLK_EQUALS,
    Greater = sdl.SDLK_GREATER,
    Question = sdl.SDLK_QUESTION,
    At = sdl.SDLK_AT,
    Leftbracket = sdl.SDLK_LEFTBRACKET,
    Backslash = sdl.SDLK_BACKSLASH,
    Rightbracket = sdl.SDLK_RIGHTBRACKET,
    Caret = sdl.SDLK_CARET,
    Underscore = sdl.SDLK_UNDERSCORE,
    Backquote = sdl.SDLK_BACKQUOTE,
    A = sdl.SDLK_a,
    B = sdl.SDLK_b,
    C = sdl.SDLK_c,
    D = sdl.SDLK_d,
    E = sdl.SDLK_e,
    F = sdl.SDLK_f,
    G = sdl.SDLK_g,
    H = sdl.SDLK_h,
    I = sdl.SDLK_i,
    J = sdl.SDLK_j,
    K = sdl.SDLK_k,
    L = sdl.SDLK_l,
    M = sdl.SDLK_m,
    N = sdl.SDLK_n,
    O = sdl.SDLK_o,
    P = sdl.SDLK_p,
    Q = sdl.SDLK_q,
    R = sdl.SDLK_r,
    S = sdl.SDLK_s,
    T = sdl.SDLK_t,
    U = sdl.SDLK_u,
    V = sdl.SDLK_v,
    W = sdl.SDLK_w,
    X = sdl.SDLK_x,
    Y = sdl.SDLK_y,
    Z = sdl.SDLK_z,
    Capslock = sdl.SDLK_CAPSLOCK,
    F1 = sdl.SDLK_F1,
    F2 = sdl.SDLK_F2,
    F3 = sdl.SDLK_F3,
    F4 = sdl.SDLK_F4,
    F5 = sdl.SDLK_F5,
    F6 = sdl.SDLK_F6,
    F7 = sdl.SDLK_F7,
    F8 = sdl.SDLK_F8,
    F9 = sdl.SDLK_F9,
    F10 = sdl.SDLK_F10,
    F11 = sdl.SDLK_F11,
    F12 = sdl.SDLK_F12,
    Printscreen = sdl.SDLK_PRINTSCREEN,
    Scrolllock = sdl.SDLK_SCROLLLOCK,
    Pause = sdl.SDLK_PAUSE,
    Insert = sdl.SDLK_INSERT,
    Home = sdl.SDLK_HOME,
    Pageup = sdl.SDLK_PAGEUP,
    Delete = sdl.SDLK_DELETE,
    End = sdl.SDLK_END,
    Pagedown = sdl.SDLK_PAGEDOWN,
    Right = sdl.SDLK_RIGHT,
    Left = sdl.SDLK_LEFT,
    Down = sdl.SDLK_DOWN,
    Up = sdl.SDLK_UP,
    Numlockclear = sdl.SDLK_NUMLOCKCLEAR,
    KpDivide = sdl.SDLK_KP_DIVIDE,
    KpMultiply = sdl.SDLK_KP_MULTIPLY,
    KpMinus = sdl.SDLK_KP_MINUS,
    KpPlus = sdl.SDLK_KP_PLUS,
    KpEnter = sdl.SDLK_KP_ENTER,
    Kp1 = sdl.SDLK_KP_1,
    Kp2 = sdl.SDLK_KP_2,
    Kp3 = sdl.SDLK_KP_3,
    Kp4 = sdl.SDLK_KP_4,
    Kp5 = sdl.SDLK_KP_5,
    Kp6 = sdl.SDLK_KP_6,
    Kp7 = sdl.SDLK_KP_7,
    Kp8 = sdl.SDLK_KP_8,
    Kp9 = sdl.SDLK_KP_9,
    Kp0 = sdl.SDLK_KP_0,
    KpPeriod = sdl.SDLK_KP_PERIOD,
    Application = sdl.SDLK_APPLICATION,
    Power = sdl.SDLK_POWER,
    KpEquals = sdl.SDLK_KP_EQUALS,
    F13 = sdl.SDLK_F13,
    F14 = sdl.SDLK_F14,
    F15 = sdl.SDLK_F15,
    F16 = sdl.SDLK_F16,
    F17 = sdl.SDLK_F17,
    F18 = sdl.SDLK_F18,
    F19 = sdl.SDLK_F19,
    F20 = sdl.SDLK_F20,
    F21 = sdl.SDLK_F21,
    F22 = sdl.SDLK_F22,
    F23 = sdl.SDLK_F23,
    F24 = sdl.SDLK_F24,
    Execute = sdl.SDLK_EXECUTE,
    Help = sdl.SDLK_HELP,
    Menu = sdl.SDLK_MENU,
    Select = sdl.SDLK_SELECT,
    Stop = sdl.SDLK_STOP,
    Again = sdl.SDLK_AGAIN,
    Undo = sdl.SDLK_UNDO,
    Cut = sdl.SDLK_CUT,
    Copy = sdl.SDLK_COPY,
    Paste = sdl.SDLK_PASTE,
    Find = sdl.SDLK_FIND,
    Mute = sdl.SDLK_MUTE,
    Volumeup = sdl.SDLK_VOLUMEUP,
    Volumedown = sdl.SDLK_VOLUMEDOWN,
    KpComma = sdl.SDLK_KP_COMMA,
    KpEqualsas400 = sdl.SDLK_KP_EQUALSAS400,
    Alterase = sdl.SDLK_ALTERASE,
    Sysreq = sdl.SDLK_SYSREQ,
    Cancel = sdl.SDLK_CANCEL,
    Clear = sdl.SDLK_CLEAR,
    Prior = sdl.SDLK_PRIOR,
    Return2 = sdl.SDLK_RETURN2,
    Separator = sdl.SDLK_SEPARATOR,
    Out = sdl.SDLK_OUT,
    Oper = sdl.SDLK_OPER,
    Clearagain = sdl.SDLK_CLEARAGAIN,
    Crsel = sdl.SDLK_CRSEL,
    Exsel = sdl.SDLK_EXSEL,
    Kp00 = sdl.SDLK_KP_00,
    Kp000 = sdl.SDLK_KP_000,
    Thousandsseparator = sdl.SDLK_THOUSANDSSEPARATOR,
    Decimalseparator = sdl.SDLK_DECIMALSEPARATOR,
    Currencyunit = sdl.SDLK_CURRENCYUNIT,
    Currencysubunit = sdl.SDLK_CURRENCYSUBUNIT,
    KpLeftparen = sdl.SDLK_KP_LEFTPAREN,
    KpRightparen = sdl.SDLK_KP_RIGHTPAREN,
    KpLeftbrace = sdl.SDLK_KP_LEFTBRACE,
    KpRightbrace = sdl.SDLK_KP_RIGHTBRACE,
    KpTab = sdl.SDLK_KP_TAB,
    KpBackspace = sdl.SDLK_KP_BACKSPACE,
    KpA = sdl.SDLK_KP_A,
    KpB = sdl.SDLK_KP_B,
    KpC = sdl.SDLK_KP_C,
    KpD = sdl.SDLK_KP_D,
    KpE = sdl.SDLK_KP_E,
    KpF = sdl.SDLK_KP_F,
    KpXor = sdl.SDLK_KP_XOR,
    KpPower = sdl.SDLK_KP_POWER,
    KpPercent = sdl.SDLK_KP_PERCENT,
    KpLess = sdl.SDLK_KP_LESS,
    KpGreater = sdl.SDLK_KP_GREATER,
    KpAmpersand = sdl.SDLK_KP_AMPERSAND,
    KpDblampersand = sdl.SDLK_KP_DBLAMPERSAND,
    KpVerticalbar = sdl.SDLK_KP_VERTICALBAR,
    KpDblverticalbar = sdl.SDLK_KP_DBLVERTICALBAR,
    KpColon = sdl.SDLK_KP_COLON,
    KpHash = sdl.SDLK_KP_HASH,
    KpSpace = sdl.SDLK_KP_SPACE,
    KpAt = sdl.SDLK_KP_AT,
    KpExclam = sdl.SDLK_KP_EXCLAM,
    KpMemstore = sdl.SDLK_KP_MEMSTORE,
    KpMemrecall = sdl.SDLK_KP_MEMRECALL,
    KpMemclear = sdl.SDLK_KP_MEMCLEAR,
    KpMemadd = sdl.SDLK_KP_MEMADD,
    KpMemsubtract = sdl.SDLK_KP_MEMSUBTRACT,
    KpMemmultiply = sdl.SDLK_KP_MEMMULTIPLY,
    KpMemdivide = sdl.SDLK_KP_MEMDIVIDE,
    KpPlusminus = sdl.SDLK_KP_PLUSMINUS,
    KpClear = sdl.SDLK_KP_CLEAR,
    KpClearentry = sdl.SDLK_KP_CLEARENTRY,
    KpBinary = sdl.SDLK_KP_BINARY,
    KpOctal = sdl.SDLK_KP_OCTAL,
    KpDecimal = sdl.SDLK_KP_DECIMAL,
    KpHexadecimal = sdl.SDLK_KP_HEXADECIMAL,
    Lctrl = sdl.SDLK_LCTRL,
    Lshift = sdl.SDLK_LSHIFT,
    Lalt = sdl.SDLK_LALT,
    Lgui = sdl.SDLK_LGUI,
    Rctrl = sdl.SDLK_RCTRL,
    Rshift = sdl.SDLK_RSHIFT,
    Ralt = sdl.SDLK_RALT,
    Rgui = sdl.SDLK_RGUI,
    Mode = sdl.SDLK_MODE,
    Audionext = sdl.SDLK_AUDIONEXT,
    Audioprev = sdl.SDLK_AUDIOPREV,
    Audiostop = sdl.SDLK_AUDIOSTOP,
    Audioplay = sdl.SDLK_AUDIOPLAY,
    Audiomute = sdl.SDLK_AUDIOMUTE,
    Mediaselect = sdl.SDLK_MEDIASELECT,
    Www = sdl.SDLK_WWW,
    Mail = sdl.SDLK_MAIL,
    Calculator = sdl.SDLK_CALCULATOR,
    Computer = sdl.SDLK_COMPUTER,
    AcSearch = sdl.SDLK_AC_SEARCH,
    AcHome = sdl.SDLK_AC_HOME,
    AcBack = sdl.SDLK_AC_BACK,
    AcForward = sdl.SDLK_AC_FORWARD,
    AcStop = sdl.SDLK_AC_STOP,
    AcRefresh = sdl.SDLK_AC_REFRESH,
    AcBookmarks = sdl.SDLK_AC_BOOKMARKS,
    Brightnessdown = sdl.SDLK_BRIGHTNESSDOWN,
    Brightnessup = sdl.SDLK_BRIGHTNESSUP,
    Displayswitch = sdl.SDLK_DISPLAYSWITCH,
    Kbdillumtoggle = sdl.SDLK_KBDILLUMTOGGLE,
    Kbdillumdown = sdl.SDLK_KBDILLUMDOWN,
    Kbdillumup = sdl.SDLK_KBDILLUMUP,
    Eject = sdl.SDLK_EJECT,
    Sleep = sdl.SDLK_SLEEP,
    App1 = sdl.SDLK_APP1,
    App2 = sdl.SDLK_APP2,
    Audiorewind = sdl.SDLK_AUDIOREWIND,
    Audiofastforward = sdl.SDLK_AUDIOFASTFORWARD,
    Softleft = sdl.SDLK_SOFTLEFT,
    Softright = sdl.SDLK_SOFTRIGHT,
    Call = sdl.SDLK_CALL,
    Endcall = sdl.SDLK_ENDCALL,
};

pub const Keymod = packed struct {
    pub const NONE: Keymod = .{};
    pub const CTRL: Keymod = .{ .lctrl = true, .rctrl = true };
    pub const SHIFT: Keymod = .{ .lshift = true, .rshift = true };
    pub const ALT: Keymod = .{ .lalt = true, .ralt = true };
    pub const GUI: Keymod = .{ .lgui = true, .rguil = true };

    lshift: bool = false,
    rshift: bool = false,
    _padding0: u4 = 0,
    lctrl: bool = false,
    rctrl: bool = false,
    lalt: bool = false,
    ralt: bool = false,
    lgui: bool = false,
    rgui: bool = false,
    num: bool = false,
    caps: bool = false,
    mode: bool = false,
    /// reserved
    scroll: bool = false,
};