import React from 'react';
import { useTranslation } from 'react-i18next';

const WhoWeAre = () => {
    const { t } = useTranslation()
    return (
        <section id="whoweare" className="who-we-are ptb-80 bg-f6f6f6">
            <div className="container">
                <div className="section-title">
                    <h2>{t("who-we-are.title1")} <span>{t("who-we-are.title2")}</span></h2>
                    <p>{t("who-we-are.content")}.</p>
                </div>

                <div className="row">
                    <div className="col-lg-4 col-md-6">
                        <div className="single-who-we-are">
                            <i className="fa fa-users"></i>
                            <h4>{t("who-we-are.professional.title")}</h4>
                            <p>{t("who-we-are.professional.content")}</p>
                            <span>1</span>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6">
                        <div className="single-who-we-are">
                            <i className="fa fa-lightbulb-o"></i>
                            <h4>{t("who-we-are.passionate.title")}</h4>
                            <p>{t("who-we-are.passionate.content")}</p>
                            <span>2</span>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6">
                        <div className="single-who-we-are">
                            <i className="fa fa-tag"></i>
                            <h4>{t("who-we-are.creative.title")}</h4>
                            <p>{t("who-we-are.creative.title")}.</p>
                            <span>3</span >
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
}

export default WhoWeAre;