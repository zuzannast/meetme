import RWR from 'react-webpack-rails';
import RWRReactRouter from 'rwr-react-router';
import { integrationsManager } from 'react-webpack-rails';
integrationsManager.register('react-router', RWRReactRouter.integrationWrapper);
RWR.run();

import Main from './components/main';
import App from './components/app';
import Index from './components/index';
import Event from './components/events/event';
import EventBox from './components/events/event_box';
import EventForm from './components/events/event_form';
import EventsList from './components/events/events_list';
import Comment from './components/comments/comment';
import CommentBox from './components/comments/comment_box';
import CommentsList from './components/comments/comments_list';
import Follow from './components/follow';
import JoinLink from './components/events/join_link';

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
RWR.registerComponent('JoinLink', JoinLink);
