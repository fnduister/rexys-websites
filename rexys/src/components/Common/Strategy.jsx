import React from 'react';
import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
 
const Strategy = () => {
    const { t } = useTranslation()
    
        return (
            <section id="strategy" className="strategy-area">
                <div className="container-fluid p-0">
                    <div className="row ">
                        <div className="col-lg-6 col-md-5">
                            <div className="image"></div>
                        </div>
                        
                        <div className="col-lg-6 col-md-7">
                            <div className="about-strategy ptb-80">
                                <div className="section-title">
                                    <h4>{t("strategy.title")}</h4>
                                    <h2>{t("strategy.subtitle1")} <span>{t("strategy.subtitle2")}</span></h2>
                                    <p>{t("strategy.content")}</p>
                                </div>
                                
                                <ul>
                                    <li><i className="fa fa-check"></i>{t("strategy.list.innovative")}</li>
                                    <li><i className="fa fa-check"></i>{t("strategy.list.fiable")}</li>
                                    <li><i className="fa fa-check"></i>{t("strategy.list.ergonomy")}</li>
                                </ul>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        );
    }
 
export default Strategy;