import React from 'react';

class App extends React.Component {
  handleConnect = () => {
    // Create form data with the necessary SSH connection details.
    const formData = new FormData();
    formData.append('hostname', 'example.com'); // Replace with your SSH server's hostname
    formData.append('port', '22'); // Replace with your SSH server's port
    formData.append('username', 'your_username'); // Replace with your SSH username
    formData.append('password', 'your_password'); // Replace with your SSH password
    formData.append('term', 'xterm-256color'); // Replace with the desired terminal type

    // Serialize the form data to a query string
    const queryString = new URLSearchParams(formData).toString();

    // Open a new window and redirect to the WebSSH form with the query string
    const newWindow = window.open(`http://localhost:8888/?${queryString}`, '_blank');
    if (newWindow) {
      newWindow.focus(); // Focus on the new window
    }
  };

  render() {
    return (
      <div>
        <button onClick={this.handleConnect}>Connect to SSH</button>
      </div>
    );
  }
}

export default App;
