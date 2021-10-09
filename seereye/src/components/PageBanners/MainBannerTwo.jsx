import React from 'react';
import OwlCarousel from 'react-owl-carousel3';
import VisibilitySensor from "react-visibility-sensor";
import AnchorLink from 'react-anchor-link-smooth-scroll';
import { useTranslation } from 'react-i18next';

const options = {
    items: 1,
    loop: true,
    autoplay: true,
    nav: true,
    responsiveClass: true,
    dots: false,
    autoplayHoverPause: true,
    mouseDrag: true,
    navText: [
        "<i class='fa fa-angle-left'></i>",
        "<i class='fa fa-angle-right'></i>"
    ]
}

const MainBanner = () => {
    const { t } = useTranslation()
    const slideData = [
        {
            heading: t("header.header1.heading"),
            subHeading: t("header.header1.subHeading"),
            text: t("header.header1.text"),
            klasName: t("header.header1.klasName")
        },
        {
            heading: t("header.header2.heading"),
            subHeading: t("header.header2.subHeading"),
            text: t("header.header2.text"),
            klasName: t("header.header2.klasName")
        }
    ]

    return (
        <OwlCarousel
            id="home"
            className="home-slides owl-theme"
            {...options}
        >
            {slideData.map((data, idx) => (
                <div className={`main-banner ${data.klasName}`} key={idx}>
                    <div className="d-table">
                        <div className="d-table-cell">
                            <div className="container">
                                <div className="row">
                                    <div className="col-lg-12 col-md-12">
                                        <VisibilitySensor>
                                            {({ isVisible }) => (
                                                <div className="main-banner-text">
                                                    <h4
                                                        className={
                                                            isVisible
                                                                ? "animated fadeInDown slow opacityOne" : ''
                                                        }
                                                    >
                                                        {data.heading}
                                                    </h4>
                                                    <h1
                                                        className={
                                                            isVisible
                                                                ? "animated fadeInDown slow opacityOne" : ''
                                                        }
                                                        dangerouslySetInnerHTML={{ __html: data.subHeading }}
                                                    />

                                                    <p
                                                        className={
                                                            isVisible
                                                                ? "animated fadeInDown slow opacityOne" : ''
                                                        }
                                                    >
                                                        {data.text}
                                                    </p>
                                                    <a
                                                        href="/flutter/"
                                                        className={`
                                                        btn btn-primary ${isVisible ? "animated fadeInDown slow opacityOne" : ""}
                                                    `}


                                                    >
                                                        {t("header.buttons.get_started")}
                                                    </a>
                                                    <AnchorLink
                                                        href="#more"
                                                        className={`
                                                        btn btn-primary view-work ${isVisible ? "animated fadeInDown slow opacityOne" : ""}
                                                        `}
                                                    >
                                                        {t("header.buttons.view_more")}
                                                    </AnchorLink>
                                                </div>
                                            )}
                                        </VisibilitySensor>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            ))}
        </OwlCarousel>
    );
}

MainBanner.defaultProps = {
    slideData: [
        {
            heading: "We Are Creative",
            subHeading: "Nice To <span>Meet</span> You",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            klasName: "item-bg-two"
        },
        {
            heading: "We Are Professional",
            subHeading: "Best <span>Digital</span> Experience",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            klasName: "item-bg-one"
        },
        {
            heading: "We Are Designer",
            subHeading: "Creativity is  <span>Intelligence</span>",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            klasName: "item-bg-three"
        },
    ]
}

export default MainBanner;