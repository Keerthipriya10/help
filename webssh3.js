<form id="sshForm" method="post" action="http://localhost:8888">
  <input type="text" name="hostname" value="example.com">
  <input type="text" name="port" value="22">
  <input type="text" name="username" value="your_username">
  <input type="password" name="password" value="your_password">
  <input type="text" name="term" value="xterm-256color">
  <textarea name="jsondata"></textarea>
  <input type="submit" value="Connect">
</form>

handleConnect = () => {
  // Open a new window
  const newWindow = window.open('', '_blank');

  // Create the form element
  const form = document.createElement('form');
  form.style.display = 'none'; // Hide the form
  form.method = 'POST'; // Use the POST method
  form.action = 'http://localhost:8888';

  // Clone the form data from the state and append it to the form
  const formData = { ...this.state.sshFormData };
  for (const key in formData) {
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = key;
    input.value = formData[key];
    form.appendChild(input);
  }

  // Append the form to the new window's document and submit it
  newWindow.document.body.appendChild(form);
  form.submit();
};
function extractXSRFToken(htmlSource) {
    const xsrfTokenMatch = htmlSource.match(/name="_xsrf" value="([A-Za-z0-9-_]+)"/);
    if (xsrfTokenMatch) {
        return xsrfTokenMatch[1];
    } else {
        return null; // XSRF token not found in the HTML source
    }
}
