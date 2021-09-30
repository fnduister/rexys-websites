import React from 'react';
import { Link } from 'react-router-dom';
import imgOne from '../../assets/images/different-img1.jpg';
import imgTwo from '../../assets/images/different-img2.jpg';
import imgThree from '../../assets/images/different-img3.jpg';
import imgFour from '../../assets/images/different-img4.jpg';
 
class WhyWeDifferent extends React.Component {

    openTabSection = (evt, tabNmae) => {
        let i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tab-panel");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" checked", "");
        }

        document.getElementById(tabNmae).style.display = "block";
        evt.currentTarget.className += " checked";
    }

    render(){
        return (
            <section className="why-we-different ptb-80 bg-f6f6f6">
                <div className="container">
                    <div className="section-title">
                        <h2>Why We <span>Are Different</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                
                    <div className="row">
                        <div className="col-lg-12 col-md-12">
                            <div className="tabset">
                                {/* <!-- Tab 1 --> */}
                                <label 
                                    onClick={(e) => this.openTabSection(e, 'speed-flexibility')} 
                                    className="tablinks checked" 
                                    name="tabset" 
                                    id="tab1" 
                                    aria-controls="speed-flexibility"  
                                    htmlFor="tab1"
                                >
                                    Speed , flexibility
                                </label>
                                {/* <!-- Tab 2 --> */}
                                <label 
                                    onClick={(e) => this.openTabSection(e, 'profeesional-work')} 
                                    className="tablinks" 
                                    name="tabset" 
                                    id="tab2" 
                                    aria-controls="profeesional-work"  
                                    htmlFor="tab2"
                                >
                                    Profeesional work
                                </label>
                                {/* <!-- Tab 3 --> */}
                                <label 
                                    onClick={(e) => this.openTabSection(e, 'experienced-staff')} 
                                    className="tablinks" 
                                    name="tabset" 
                                    id="tab3" 
                                    aria-controls="experienced-staff"  
                                    htmlFor="tab3"
                                >
                                    Experienced Staff
                                </label>
                                {/* <!-- Tab 4 --> */}
                                <label 
                                    onClick={(e) => this.openTabSection(e, 'custom-support')} 
                                    className="tablinks" 
                                    name="tabset" 
                                    id="tab4" 
                                    aria-controls="custom-support"  
                                    htmlFor="tab4"
                                >
                                    Custom Support
                                </label>

                                <div className="tab-panels">
                                    <section id="speed-flexibility" className="tab-panel" style={{display: "block"}}>
                                        <div className="row">
                                            <div className="col-lg-6 col-md-6">
                                                <div className="why-we-different-text">
                                                    <h4>Speed , flexibility</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
                                                    <ul>
                                                        <li><i className="fa fa-check"></i>Creative Design</li>
                                                        <li><i className="fa fa-check"></i>Retina Ready</li>
                                                        <li><i className="fa fa-check"></i>Responsive Design</li>
                                                        <li><i className="fa fa-check"></i>Modern Design</li>
                                                        <li><i className="fa fa-check"></i>Awesome Design</li>
                                                        <li><i className="fa fa-check"></i>Digital Marketing & Branding</li>
                                                    </ul>
                                                    
                                                    <Link to="#" className="btn btn-primary">Read More</Link>
                                                </div>
                                            </div>
                                            
                                            <div className="col-lg-6 col-md-6">
                                                <div className="why-we-different-img">
                                                    <img src={imgOne} alt="img" />
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    
                                    <section id="profeesional-work" className="tab-panel">
                                        <div className="row">
                                            <div className="col-lg-6 col-md-6">
                                                <div className="why-we-different-text">
                                                    <h4>Profeesional work</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
                                                    <ul>
                                                        <li><i className="fa fa-check"></i>Creative Design</li>
                                                        <li><i className="fa fa-check"></i>Retina Ready</li>
                                                        <li><i className="fa fa-check"></i>Responsive Design</li>
                                                        <li><i className="fa fa-check"></i>Modern Design</li>
                                                        <li><i className="fa fa-check"></i>Awesome Design</li>
                                                        <li><i className="fa fa-check"></i>Digital Marketing & Branding</li>
                                                    </ul>
                                                    
                                                    <Link to="#" className="btn btn-primary">Read More</Link>
                                                </div>
                                            </div>
                                            
                                            <div className="col-lg-6 col-md-6">
                                                <div className="why-we-different-img">
                                                    <img src={imgTwo} alt="img" />
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    
                                    <section id="experienced-staff" className="tab-panel">
                                        <div className="row">
                                            <div className="col-lg-6 col-md-6">
                                                <div className="why-we-different-text">
                                                    <h4>Experienced staff</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
                                                    <ul>
                                                        <li><i className="fa fa-check"></i>Creative Design</li>
                                                        <li><i className="fa fa-check"></i>Retina Ready</li>
                                                        <li><i className="fa fa-check"></i>Responsive Design</li>
                                                        <li><i className="fa fa-check"></i>Modern Design</li>
                                                        <li><i className="fa fa-check"></i>Awesome Design</li>
                                                        <li><i className="fa fa-check"></i>Digital Marketing & Branding</li>
                                                    </ul>
                                                    
                                                    <Link to="#" className="btn btn-primary">Read More</Link>
                                                </div>
                                            </div>
                                            
                                            <div className="col-lg-6 col-md-6">
                                                <div className="why-we-different-img">
                                                    <img src={imgThree} alt="img" />
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    
                                    <section id="custom-support" className="tab-panel">
                                        <div className="row">
                                            <div className="col-lg-6 col-md-6">
                                                <div className="why-we-different-text">
                                                    <h4>24/7 support</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
                                                    <ul>
                                                        <li><i className="fa fa-check"></i>Creative Design</li>
                                                        <li><i className="fa fa-check"></i>Retina Ready</li>
                                                        <li><i className="fa fa-check"></i>Responsive Design</li>
                                                        <li><i className="fa fa-check"></i>Modern Design</li>
                                                        <li><i className="fa fa-check"></i>Awesome Design</li>
                                                        <li><i className="fa fa-check"></i>Digital Marketing & Branding</li>
                                                    </ul>
                                                    
                                                    <Link to="#" className="btn btn-primary">Read More</Link>
                                                </div>
                                            </div>
                                            
                                            <div className="col-lg-6 col-md-6">
                                                <div className="why-we-different-img">
                                                    <img src={imgFour} alt="img" />
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        );
    }
}
 
export default WhyWeDifferent;