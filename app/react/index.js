import RWR from 'react-webpack-rails';
import RWRReactRouter from 'rwr-react-router';
import { integrationsManager } from 'react-webpack-rails';
integrationsManager.register('react-router', RWRReactRouter.integrationWrapper);
RWR.run();

import Main from './components/main';
import App from './components/app';
import Index from './components/index';
import Event from './components/event';
import EventBox from './components/event_box';
import EventForm from './components/event_form';
import EventsList from './components/events_list';
import Comment from './components/comment';
import CommentBox from './components/comment_box';
import CommentsList from './components/comments_list';
import Follow from './components/follow';

RWRReactRouter.register('Main', Main);
RWR.registerComponent('App', App);
RWR.registerComponent('Index', Index);
RWR.registerComponent('Event', Event);
RWR.registerComponent('EventBox', EventBox);
RWR.registerComponent('EventForm', EventForm);
RWR.registerComponent('EventsList', EventsList);
RWR.registerComponent('Comment', Comment);
RWR.registerComponent('CommentBox', CommentBox);
RWR.registerComponent('CommentsList', CommentsList);
RWR.registerComponent('Follow', Follow);
