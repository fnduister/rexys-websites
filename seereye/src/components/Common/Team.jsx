import React from 'react';
import OwlCarousel from 'react-owl-carousel3';
import scalable from '../../assets/images/seereye/network-server-room-PF7RVUX.jpg';
import synchronous from '../../assets/images/seereye/blue-futuristic-stream-data-communication-flying-i-JX8FY62.jpg';
import sensors from '../../assets/images/seereye/car-wheel-clamp-with-wheel-align-device-for-wheel--4SELWRA.JPG';
import { useTranslation } from 'react-i18next';

const options = {
  loop: true,
  autoplay: true,
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

const Team = ({ data }) => {
  const { t } = useTranslation();

  const content = [
    {
      title: t("welcome.box1.title"),
      content: t("welcome.box1.content"),
      pic: scalable,
    },
    {
      title: t("welcome.box2.title"),
      content: t("welcome.box2.content"),
      pic: synchronous,
    },
    {
      title: t("welcome.box3.title"),
      content: t("welcome.box3.content"),
      pic: sensors,
    },
  ]
  return (
    <section id="team" className="team-area ptb-80">
      {console.log("tems: ", data)}
      {data &&
        <div className="container">
          <div className="section-title">
            <h2>{data.title} <span>SeerEye</span></h2>
            <p>{data.contentTitle}</p>
          </div>

          <div className="row">
            <OwlCarousel
              className="team-slider owl-carousel owl-theme"
              {...options}
            >
              {
                data.contentsCollection.items.map((info, i) =>

                  <div className="col-lg-12">
                    <div className="our-team">
                      <div className="pic">
                        <img src={content[i].pic} alt="team-img" />
                      </div>

                      <div className="team-content">
                        <h3 className="title">{info.title}</h3>
                      </div>

                      <div className="social">
                        <p>{info.content}</p>
                      </div>
                    </div>
                  </div>
                )
              }

            </OwlCarousel>
          </div>
        </div>
      }
    </section>
  );
}

export default Team;