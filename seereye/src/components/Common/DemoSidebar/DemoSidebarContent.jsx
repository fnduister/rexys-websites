import React, { Component } from 'react';
import { Link } from 'react-router-dom';

import HomeOne from '../../../assets/images/demo-img/home-1.jpg';
import HomeTwo from '../../../assets/images/demo-img/home-2.jpg';
import HomeThree from '../../../assets/images/demo-img/home-3.jpg';
import HomeFour from '../../../assets/images/demo-img/home-4.jpg';
import HomeFive from '../../../assets/images/demo-img/home-5.jpg';
import HomeSix from '../../../assets/images/demo-img/home-6.jpg';
import HomeSeven from '../../../assets/images/demo-img/home-7.jpg';
import HomeEight from '../../../assets/images/demo-img/home-8.jpg';
import HomeNine from '../../../assets/images/demo-img/home-9.jpg';
import HomeTen from '../../../assets/images/demo-img/home-10.jpg';
import HomeEleven from '../../../assets/images/demo-img/home-11.jpg';
import HomeTwelve from '../../../assets/images/demo-img/home-12.jpg';

class DemoSidebarContent extends Component {

    state = {
        modal: false
    };

    closeModal = () => {
        this.props.onClick(this.state.modal);
    }

    render() {
        return (
            <React.Fragment>
                <div className={`example-demo-modal ${this.props.active}`}>
                    <div className="inner">
                        <ul>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeOne} alt="Home One" />
                                    <span>Home One</span>
                                    <Link to="/" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeTwo} alt="Home Two" />
                                    <span>Home Two</span>
                                    <Link to="/home-two" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeThree} alt="Home Three" />
                                    <span>Home Three</span>
                                    <Link to="/home-three" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeFour} alt="Home Four" />
                                    <span>Home Four</span>
                                    <Link to="/home-four" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeFive} alt="Home Five" />
                                    <span>Home Five</span>
                                    <Link to="/home-five" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeSix} alt="Home Six" />
                                    <span>Home Six</span>
                                    <Link to="/home-six" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeSeven} alt="Home Seven" />
                                    <span>Home Seven</span>
                                    <Link to="/home-seven" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeEight} alt="Home Eight" />
                                    <span>Home Eight</span>
                                    <Link to="/home-eight" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeNine} alt="Home Nine" />
                                    <span>Home Nine</span>
                                    <Link to="/home-nine" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeTen} alt="Home Ten" />
                                    <span>Home Ten</span>
                                    <Link to="/home-ten" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeEleven} alt="Home Eleven" />
                                    <span>Home Eleven</span>
                                    <Link to="/home-eleven" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                            <li>
                                <div className="single-demo">
                                    <img src={HomeTwelve} alt="Home Twelve" />
                                    <span>Home Twelve</span>
                                    <Link to="/home-twelve" target="_blank" className="link-btn"></Link>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <div className="header-title">
                        <button className="example-demo-modal-control" onClick={this.closeModal} >
                            <i className="fa fa-close"></i>
                        </button>
                        <div className="title">View Demo</div>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

export default DemoSidebarContent;