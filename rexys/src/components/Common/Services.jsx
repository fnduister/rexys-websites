import React from 'react';
import imgOne from '../../assets/images/rexys/globe.jpg';
import imgTwo from '../../assets/images/rexys/circuit.jpg';
import imgThree from '../../assets/images/rexys/appareil-photo.jpg';
import { useTranslation } from 'react-i18next';

const Services = () => {
    const { t } = useTranslation()
    return (
        <section id="services" className="services-area ptb-80">
            <div className="container">
                <div className="section-title">
                    <h2>Welcome to <span>Rexys</span></h2>
                    <p>{t("welcome.title_content")}</p>
                </div>

                <div className="row">
                    <div className="col-lg-4 col-md-6">
                        <div className="single-services">
                            <div className="services-img">
                                <img src={imgOne} alt="services-img" />

                                <div className="icon">
                                    <i className="fa fa-pencil-square-o"></i>
                                </div>
                            </div>

                            <div className="services-content">
                                <h3>{t("welcome.box1.title")}</h3>
                                <p>{t("welcome.box1.content")}</p>
                            </div>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6">
                        <div className="single-services">
                            <div className="services-img">
                                <img src={imgTwo} alt="services-img" />

                                <div className="icon">
                                    <i className="fa fa-linode"></i>
                                </div>
                            </div>

                            <div className="services-content">
                                <h3>{t("welcome.box2.title")}</h3>
                                <p>{t("welcome.box2.content")}</p>
                            </div>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6">
                        <div className="single-services">
                            <div className="services-img">
                                <img src={imgThree} alt="services-img" />

                                <div className="icon">
                                    <i className="fa fa-desktop"></i>
                                </div>
                            </div>

                            <div className="services-content">
                                <h3>{t("welcome.box3.title")}</h3>
                                <p>{t("welcome.box3.content")}</p>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </section>
    )
}


export default Services;