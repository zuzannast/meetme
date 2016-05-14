import RWR from 'react-webpack-rails';
RWR.run();

import Main from './components/main';
RWR.registerComponent('Main', Main);

import EventBox from './components/event_box';
RWR.registerComponent('EventBox', EventBox);
