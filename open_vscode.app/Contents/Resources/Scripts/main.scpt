JsOsaDAS1.001.00bplist00�Vscript_�// Open Visual Studio Code in the current folder.
// @steveruizok

const app = Application.currentApplication();
app.includeStandardAdditions = true;
const terminalApp = Application("Terminal");
const finderApp = Application("Finder");

function getTopWindowUrl() {
	// Get all finder windows
  const windows = finderApp.finderWindows();

	// Bail if finder doesn't have any open windows
  if (!windows.length) {
    throw new Error("No current window.");
  }

	// Get the path from the front-most window
	let url = windows[0].target().url()
	
	// chop path into a url that will work on the command line
	return decodeURI(url).slice(7).replace(" ", "\\ ");
}

// Open terminal, cd into current folder, open vscode, then close terminal window
try {
	const url = getTopWindowUrl();
	const script = `cd ${url}; code .; clear`;
 	terminalApp.doScript(script);
	delay(0.5);
	terminalApp.activate()
	terminalApp.windows[0].close()
} catch (err) {
  console.log(err)
}                              � jscr  ��ޭ