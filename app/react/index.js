import RWR from 'react-webpack-rails';
RWR.run();

import HelloWorld from './components/hello-world';
RWR.registerComponent('HelloWorld', HelloWorld);

import Main from './components/main';
RWR.registerComponent('Main', Main);

import Greet from './components/greet';
RWR.registerComponent('Greet', Greet);
