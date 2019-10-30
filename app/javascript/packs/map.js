import mapboxgl from 'mapbox-gl';

const initMapBox = (coordinates) => {
  mapboxgl.accessToken = 'pk.eyJ1IjoibXNueWRlcjE5MyIsImEiOiJjazF1NGx0a2swdjNjM2VudWR1b2V5NWk0In0.BzjSjP1ONJmKynLmWO0bMQ';
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9',
    center: [-0.077, 1],
    zoom: 1
  });
  if (coordinates) {
    new mapboxgl.Marker()
      .setLngLat(coordinates)
      .addTo(map);
    map.setCenter(coordinates);
    map.setZoom(12);
  }
};

export default initMapBox;
