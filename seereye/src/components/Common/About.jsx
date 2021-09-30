import React from 'react';
import ModalVideo from 'react-modal-video';
import { Link } from 'react-router-dom';
import aboutImg from '../../assets/images/about.jpg';
 
class About extends React.Component {
    state = {
        isOpen: false
    }

    openModal = () => {
        this.setState({isOpen: true})
    }
    render(){
        return (
            <section id="about" className="about-area ptb-80 bg-f6f6f6">
                <div className="container">
                    <div className="section-title">
                        <h2>About <span>Rexys</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                    
                    <div className="row">
                        <div className="col-lg-6 col-md-12">
                            <div className="about-Rexys">
                                <div className="section-title">
                                    <h2>We Are Digital <span>Marketing & Branding</span></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>

                                <ul className="pull-left">
                                    <li><i className="fa fa-check"></i>Creative Design</li>
                                    <li><i className="fa fa-check"></i>Retina Ready</li>
                                    <li><i className="fa fa-check"></i>Responsive Design</li>
                                </ul>

                                <ul>
                                    <li><i className="fa fa-check"></i>Modern Design</li>
                                    <li><i className="fa fa-check"></i>Awesome Design</li>
                                    <li><i className="fa fa-check"></i>Digital Marketing & Branding</li>
                                </ul>

                                <Link to="#" className="btn btn-primary">Read More</Link>
                            </div>
                        </div>
                        
                        <div className="col-lg-6 col-md-12">
                            <div className="about-video">
                                <img src={aboutImg} alt="about" />
                                <div className="video-btn">
                                    <Link 
                                        onClick={e => {e.preventDefault(); this.openModal()}}
                                        to="#" 
                                        className="popup-youtube"
                                    >
                                        <i className="fa fa-play"></i>
                                    </Link>
                                    <ModalVideo 
                                        channel='youtube' 
                                        isOpen={this.state.isOpen} 
                                        videoId='bk7McNUjWgw' 
                                        onClose={() => this.setState({isOpen: false})} 
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        );
    }
}
 
export default About;