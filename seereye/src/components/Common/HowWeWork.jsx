import React from 'react';
 
class HowWeWork extends React.Component {
    render(){
        return (
            <section className="how-work ptb-80">
                <div className="container">
                    <div className="section-title">
                        <h2>How We <span>Work</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                
                    <div className="row">
                        <div className="col-lg-4 col-md-6">
                            <div className="single-how-work">
                                <h3>01.</h3>
                                <h4>Planing</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.</p>
                            </div>
                        </div>
                        
                        <div className="col-lg-4 col-md-6">
                            <div className="single-how-work">
                                <h3>02.</h3>
                                <h4>Designing</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.</p>
                            </div>
                        </div>
                        
                        <div className="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
                            <div className="single-how-work">
                                <h3>03.</h3>
                                <h4>Product Launch</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        );
    }
}
 
export default HowWeWork;