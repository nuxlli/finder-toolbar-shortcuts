JsOsaDAS1.001.00bplist00�Vscript_x// Open a Termina window in the current folder.
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

// Open terminal, cd into current folder, and activate terminal
try {
	const url = getTopWindowUrl();
	const script = `cd ${url}; clear`;
 	terminalApp.doScript(script);
	terminalApp.activate()
} catch (err) {
  console.log(err)
}                              �jscr  ��ޭ