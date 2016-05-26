import Index from '.components/index';

let documentReady = () => {
  let reactNode = document.getElementById('react');
  if (reactNode) {
    React.render(<Index />, reactNode);
  }
};

$(documentReady);
