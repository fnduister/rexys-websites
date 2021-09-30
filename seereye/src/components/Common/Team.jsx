import React from 'react';
import { Link } from 'react-router-dom';
import OwlCarousel from 'react-owl-carousel3';
import teamOne from '../../assets/images/team-1.jpg';
import teamTwo from '../../assets/images/team-2.jpg';
import teamThree from '../../assets/images/team-3.jpg';
import teamFour from '../../assets/images/team-4.jpg';
import teamFive from '../../assets/images/team-5.jpg';
import teamSix from '../../assets/images/team-6.jpg';

const options = {
    loop: true,
    autoplay:true,
    nav: false,
    margin: 30,
    mouseDrag: true,
    autoplayHoverPause: true,
    responsiveClass: true,
    dots: true,
    navText: [
        "<i class='fa fa-angle-left'></i>",
        "<i class='fa fa-angle-right'></i>"
    ],
    responsive: {
        0: {
            items: 1
        },
        576: {
            items: 2
        },
        768: {
            items: 2
        },
        1024: {
            items: 3
        }
    }
}
 
class Team extends React.Component {
    render(){
        return (
            <section id="team" className="team-area ptb-80">
                <div className="container">
                    <div className="section-title">
                        <h4>Meet Rexys</h4>
                        <h2>Our Creative <span>Team</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                    
                    <div className="row">
                        <OwlCarousel 
                            className="team-slider owl-carousel owl-theme"
                            {...options}
                        >
                            <div className="col-lg-12">
                                <div className="our-team">
                                    <div className="pic">
                                        <img src={teamOne} alt="team-img" />
                                    </div>

                                    <div className="team-content">
                                        <h3 className="title">Jisan Smith</h3>
                                        <span className="post">CEO</span>
                                    </div>

                                    <div className="social">
                                        <ul>
                                            <li><Link to="#" className="fa fa-facebook"></Link></li>
                                            <li><Link to="#" className="fa fa-google-plus"></Link></li>
                                            <li><Link to="#" className="fa fa-instagram"></Link></li>
                                            <li><Link to="#" className="fa fa-linkedin"></Link></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div className="col-lg-12">
                                <div className="our-team">
                                    <div className="pic">
                                        <img src={teamTwo} alt="team-img" />
                                    </div>

                                    <div className="team-content">
                                        <h3 className="title">John Ahmed</h3>
                                        <span className="post">Web Developer</span>
                                    </div>

                                    <div className="social">
                                        <ul>
                                            <li><Link to="#" className="fa fa-facebook"></Link></li>
                                            <li><Link to="#" className="fa fa-google-plus"></Link></li>
                                            <li><Link to="#" className="fa fa-instagram"></Link></li>
                                            <li><Link to="#" className="fa fa-linkedin"></Link></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div className="col-lg-12">
                                <div className="our-team">
                                    <div className="pic">
                                        <img src={teamThree} alt="team-img" />
                                    </div>

                                    <div className="team-content">
                                        <h3 className="title">Arif John</h3>
                                        <span className="post">Back-End Developer</span>
                                    </div>
                                    
                                    <div className="social">
                                        <ul>
                                            <li><Link to="#" className="fa fa-facebook"></Link></li>
                                            <li><Link to="#" className="fa fa-google-plus"></Link></li>
                                            <li><Link to="#" className="fa fa-instagram"></Link></li>
                                            <li><Link to="#" className="fa fa-linkedin"></Link></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div className="col-lg-12">
                                <div className="our-team">
                                    <div className="pic">
                                        <img src={teamFour} alt="team-img" />
                                    </div>

                                    <div className="team-content">
                                        <h3 className="title">Sakib Johan</h3>
                                        <span className="post">Front-End Developer</span>
                                    </div>

                                    <div className="social">
                                        <ul>
                                            <li><Link to="#" className="fa fa-facebook"></Link></li>
                                            <li><Link to="#" className="fa fa-google-plus"></Link></li>
                                            <li><Link to="#" className="fa fa-instagram"></Link></li>
                                            <li><Link to="#" className="fa fa-linkedin"></Link></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div className="col-lg-12">
                                <div className="our-team">
                                    <div className="pic">
                                        <img src={teamFive} alt="team-img" />
                                    </div>

                                    <div className="team-content">
                                        <h3 className="title">John Doe</h3>
                                        <span className="post">Web Developer</span>
                                    </div>

                                    <div className="social">
                                        <ul>
                                            <li><Link to="#" className="fa fa-facebook"></Link></li>
                                            <li><Link to="#" className="fa fa-google-plus"></Link></li>
                                            <li><Link to="#" className="fa fa-instagram"></Link></li>
                                            <li><Link to="#" className="fa fa-linkedin"></Link></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div className="col-lg-12">
                                <div className="our-team">
                                    <div className="pic">
                                        <img src={teamSix} alt="team-img" />
                                    </div>

                                    <div className="team-content">
                                        <h3 className="title">Olivia Smith</h3>
                                        <span className="post">Photographer</span>
                                    </div>
                                    
                                    <div className="social">
                                        <ul>
                                            <li><Link to="#" className="fa fa-facebook"></Link></li>
                                            <li><Link to="#" className="fa fa-google-plus"></Link></li>
                                            <li><Link to="#" className="fa fa-instagram"></Link></li>
                                            <li><Link to="#" className="fa fa-linkedin"></Link></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </OwlCarousel>
                    </div>
                </div>
            </section>
        );
    }
}
 
export default Team;