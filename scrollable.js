import React from 'react';
import 'antd/dist/antd.css';
import { Row, Col } from 'antd';

const App = () => {
  const containerStyle = {
    height: '100vh', // Full viewport height
    overflow: 'hidden', // Prevents overflow from parent
  };

  const scrollableStyle = {
    height: '100%',
    overflowY: 'auto', // Enables vertical scrolling
  };

  return (
    <div style={containerStyle}>
      <Row style={{ height: '100%' }}>
        <Col span={7} style={{ ...scrollableStyle, background: '#f0f0f0' }}>
          {/* 30% width content */}
          <div style={{ padding: '20px' }}>
            <h2>30% Width</h2>
            <p>Content goes here...</p>
            <p>More content...</p>
            <p>Even more content...</p>
            {/* Add more content to enable scrolling */}
          </div>
        </Col>
        <Col span={17} style={{ ...scrollableStyle, background: '#ffffff' }}>
          {/* 70% width content */}
          <div style={{ padding: '20px' }}>
            <h2>70% Width</h2>
            <p>Content goes here...</p>
            <p>More content...</p>
            <p>Even more content...</p>
            {/* Add more content to enable scrolling */}
          </div>
        </Col>
      </Row>
    </div>
  );
};

export default App;
