import React from 'react';

class App extends React.Component {

  const hasSpaces = /\s/.test(newText);

    // Check for special characters using a regular expression
    const hasSpecialChars = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\\-/|\\^]/.test(newText);

  state = {
    sshFormData: {
      hostname: 'example.com', // Replace with your SSH server's hostname
      port: '22', // Replace with your SSH server's port
      username: 'your_username', // Replace with your SSH username
      password: 'your_password', // Replace with your SSH password
      term: 'xterm-256color', // Replace with the desired terminal type
      jsondata: '', // Initialize the JSON data field as an empty string
    },
  };

  handleInputChange = (event) => {
    const { name, value } = event.target;

    this.setState((prevState) => ({
      sshFormData: {
        ...prevState.sshFormData,
        [name]: value,
      },
    }));
  };

  handleConnect = () => {
    // Create form data with the SSH connection details and JSON data.
    const formData = new FormData();
    const { sshFormData } = this.state;

    Object.entries(sshFormData).forEach(([key, value]) => {
      formData.append(key, value);
    });

    // Serialize the form data to a query string
    const queryString = new URLSearchParams(formData).toString();

    // Open a new window and redirect to the WebSSH form with the query string
    const newWindow = window.open(`http://localhost:8888/?${queryString}`, '_blank');
    if (newWindow) {
      newWindow.focus(); // Focus on the new window
    }
  };

  render() {
    const { sshFormData } = this.state;

    return (
      <div>
        <div>
          <label>
            Hostname:
            <input type="text" name="hostname" value={sshFormData.hostname} onChange={this.handleInputChange} />
          </label>
        </div>
        <div>
          <label>
            Port:
            <input type="text" name="port" value={sshFormData.port} onChange={this.handleInputChange} />
          </label>
        </div>
        <div>
          <label>
            Username:
            <input type="text" name="username" value={sshFormData.username} onChange={this.handleInputChange} />
          </label>
        </div>
        <div>
          <label>
            Password:
            <input type="password" name="password" value={sshFormData.password} onChange={this.handleInputChange} />
          </label>
        </div>
        <div>
          <label>
            Terminal Type:
            <input type="text" name="term" value={sshFormData.term} onChange={this.handleInputChange} />
          </label>
        </div>
        <div>
          <label>
            JSON Data:
            <textarea
              name="jsondata"
              value={sshFormData.jsondata}
              onChange={this.handleInputChange}
              rows="4"
              cols="50"
            ></textarea>
          </label>
        </div>
        <div>
          <button onClick={this.handleConnect}>Connect to SSH</button>
        </div>
      </div>
    );
  }
}

export default App;
// Open a new window
const newWindow = window.open('http://localhost:8888/', '_blank');

// Wait for the new window to load
newWindow.addEventListener('load', () => {
    // Create the POST request headers
    const headers = new Headers();
    headers.append('Authorization', 'Bearer your_access_token');
    headers.append('Custom-Header', 'custom-value');

    // Create a FormData object if needed
    const formData = new FormData();
    formData.append('field1', 'value1');
    formData.append('field2', 'value2');

    // Make the POST request
    fetch('http://localhost:8888/', {
        method: 'POST',
        headers: headers,
        body: formData, // Include the FormData if needed
    })
    .then(response => {
        // Handle the response here
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
