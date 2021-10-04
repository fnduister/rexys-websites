import React from 'react';
import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

const Welcome = () => {
    const { t } = useTranslation();
    return (
        <section id="welcome" className="welcome-area ptb-80">
            <div className="container">
                <div className="section-title">
                    <h2>Welcome to <span>seereye</span></h2>
                    <p>{t("welcome.title_content")}</p>
                </div>

                <div className="row">
                    <div className="col-lg-4 col-md-6">
                        <div className="single-box">
                            <i className="fa fa-pencil-square-o icon"></i>
                            <h3>Creative Design</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
                            <Link to="#" title="Read More" className="link-btn"><i className="fa fa-arrow-right"></i></Link>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6">
                        <div className="single-box">
                            <i className="fa fa-laptop icon"></i>
                            <h3>Friendly Codes</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
                            <Link to="#" title="Read More" className="link-btn"><i className="fa fa-arrow-right"></i></Link>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
                        <div className="single-box">
                            <i className="fa fa-life-ring icon"></i>
                            <h3>Fast Support</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
                            <Link to="#" title="Read More" className="link-btn"><i className="fa fa-arrow-right"></i></Link>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
}


export default Welcome;