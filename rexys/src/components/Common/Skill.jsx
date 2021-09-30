import React from 'react';
import ModalVideo from 'react-modal-video';
import { Link } from 'react-router-dom';
import videoImg from '../../assets/images/video-img.jpg';
 
class Skill extends React.Component {
    state = {
        isOpen: false
    }

    openModal = () => {
        this.setState({isOpen: true})
    }
    render(){
        return (
            <section className="skill-area ptb-80 bg-f6f6f6">
                <div className="container">
                    <div className="row">
                        <div className="col-lg-6 col-md-12">
                            <div className="about-skill">
                                <div className="section-title">
                                    <h2>Some of Our <span>Skills</span></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                                
                                <h3 className="progress-title">Branding</h3>
                                <div className="progress">
                                    <div className="progress-bar" style={{width: "92%"}}>
                                        <div className="progress-value">92%</div>
                                    </div>
                                </div>
                                
                                <h3 className="progress-title">Marketing</h3>
                                <div className="progress">
                                    <div className="progress-bar" style={{width: "97%"}}>
                                        <div className="progress-value">97%</div>
                                    </div>
                                </div>
                                
                                <h3 className="progress-title">Design</h3>
                                <div className="progress">
                                    <div className="progress-bar" style={{width: "90%"}}>
                                        <div className="progress-value">90%</div>
                                    </div>
                                </div>
                                
                                <h3 className="progress-title">Development</h3>
                                <div className="progress mb-0">
                                    <div className="progress-bar" style={{width: "95%"}}>
                                        <div className="progress-value">95%</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                        <div className="col-lg-6 col-md-12">
                            <div className="skill-video">
                                <img src={videoImg} alt="video-img" />
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
 
export default Skill;