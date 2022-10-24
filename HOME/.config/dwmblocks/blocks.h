//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"vol: ", "if [ $(pamixer --get-mute) = true ]; then echo \"Muted\"; else echo $(pamixer --get-volume); fi", 0, 10 },
	{"BAT1: ", "cat /sys/class/power_supply/BAT1/capacity | tr -s '\\n ' '\\%';", 5, 0},
	{"", "cat /sys/class/power_supply/BAT1/status", 3, 0},
	{"", "date '+%Y-%m-%d (%a) %H:%M'",	5,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
