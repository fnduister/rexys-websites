import React from 'react';
import AnchorLink from 'react-anchor-link-smooth-scroll';
import { useTranslation } from 'react-i18next';

const MainBanner = () => {
    const { t } = useTranslation();
    return (
        <div id="home" className="main-banner item-bg-one">
            <div className="d-table">
                <div className="d-table-cell">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 col-md-12">
                                <div className="main-banner-text">
                                    <h4>{t("header.title")}</h4>
                                    <h1>The Best <span>Consulting</span> Experience</h1>
                                    <p>{t("header.title_content")}</p>
                                    <AnchorLink href="#work" className="btn btn-primary view-work">{t("header.view_work")}</AnchorLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}


export default MainBanner;