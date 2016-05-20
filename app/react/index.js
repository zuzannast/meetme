import RWR from 'react-webpack-rails';
RWR.run();

import Main from './components/main';
RWR.registerComponent('Main', Main);

import EventBox from './components/event_box';
RWR.registerComponent('EventBox', EventBox);

import EventsList from './components/events_list';
RWR.registerComponent('EventsList', EventsList);

import Event from './components/event';
RWR.registerComponent('Event', Event);
