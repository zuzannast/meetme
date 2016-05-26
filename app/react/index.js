import RWR from 'react-webpack-rails';
import RWRReactRouter from 'rwr-react-router';
import { integrationsManager } from 'react-webpack-rails';
integrationsManager.register('react-router', RWRReactRouter.integrationWrapper);
RWR.run();

import App from './components/app';
RWR.registerComponent('App', App);

import Index from './components/index';
RWR.registerComponent('Index', Index);

import EventBox from './components/event_box';
RWR.registerComponent('EventBox', EventBox);

import EventsList from './components/events_list';
RWR.registerComponent('EventsList', EventsList);

import Event from './components/event';
RWR.registerComponent('Event', Event);

import Follow from './components/follow';
RWR.registerComponent('Follow', Follow);

import Main from './components/main';
RWRReactRouter.register('Main', Main);
