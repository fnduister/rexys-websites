import '../src/assets/css/bootstrap.min.css';
import '../node_modules/react-modal-video/css/modal-video.css';
import 'react-accessible-accordion/dist/fancy-example.css';
import '../src/assets/css/font-awesome.min.css';
import '../src/assets/css/animate.css';
import '../src/assets/css/style.css';
import '../src/assets/css/responsive.css';

import React, { Suspense } from 'react';
import { BrowserRouter as Router, Route } from "react-router-dom";
import Navigation from './components/Navigation/Navigation';
import Preloader from './components/Common/Preloader';
import HomeOne from '../src/components/Pages/HomeOne';
import HomeTwo from '../src/components/Pages/HomeTwo';
import HomeThree from '../src/components/Pages/HomeThree';
import HomeFour from '../src/components/Pages/HomeFour';
import HomeFive from './components/Pages/HomeFive';
import HomeSix from './components/Pages/HomeSix';
import HomeSeven from './components/Pages/HomeSeven';
import HomeEight from './components/Pages/HomeEight';
import HomeNine from './components/Pages/HomeNine';
import HomeTen from './components/Pages/HomeTen';
import HomeEleven from './components/Pages/HomeEleven';
import HomeTwelve from './components/Pages/HomeTwelve';
import Blog from './components/Pages/Blog';
import BlogDetails from './components/Pages/BlogDetails';
import logo from './assets/logos/logo_rexys.png'


// loading component for suspense fallback
const Loader = () => (
    <div className="App">
        <img src={logo} className="App-logo" alt="logo" />
        <div>loading...</div>
    </div>
);

class App extends React.Component {

    state = {
        loading: true
    };

    componentDidMount() {
        this.demoAsyncCall().then(() => this.setState({ loading: false }));
    }

    demoAsyncCall = () => {
        return new Promise((resolve) => setTimeout(() => resolve(), 2000));
    }

    hashLinkScroll = () => {
        const { hash } = window.location;
        if (hash !== '') {
            setTimeout(() => {
                const id = hash.replace('#', '');
                const element = document.getElementById(id);
                if (element) element.scrollIntoView();
            }, 0);
        }
    }

    render() {
        return (
            <Suspense fallback={<Preloader />}>
                <Router onUpdate={this.hashLinkScroll}>
                    <>
                        {this.state.loading ? <Preloader /> : ''}
                        <Navigation />
                        <Route path="/" exact component={HomeOne} />
                    </>
                </Router>
            </Suspense>
        );
    }
}

export default App;
