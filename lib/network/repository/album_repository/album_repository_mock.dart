import 'package:get/get.dart';
import 'package:last_fm_api/models/albumdetail.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/models/albummatches.dart';
import 'package:last_fm_api/models/image.dart';
import 'package:last_fm_api/models/index.dart';
import 'package:last_fm_api/models/track.dart';
import 'package:last_fm_api/models/tracks.dart';
import 'package:last_fm_api/network/exception/network_exceptions.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository.dart';
import 'package:last_fm_api/network/result/api_result.dart';

class AlbumRepositoryMock extends GetxService implements AlbumRepository {
  static AlbumRepositoryMock get to => Get.find<AlbumRepositoryMock>();

  @override
  Future<ApiResult<Albumdetail>> fetchAlbumDetail({String? mbid, String? album, String? artist}) async {
    try {
      // dynamic response = r'''
      //     {"album":{"artist":"Disturbed","tags":{"tag":[{"url":"https:\/\/www.last.fm\/tag\/metal","name":"metal"},{"url":"https:\/\/www.last.fm\/tag\/hard+rock","name":"hard rock"},{"url":"https:\/\/www.last.fm\/tag\/nu+metal","name":"nu metal"},{"url":"https:\/\/www.last.fm\/tag\/alternative+metal","name":"alternative metal"},{"url":"https:\/\/www.last.fm\/tag\/rock","name":"rock"}]},"name":"Believe","image":[{"size":"small","#text":"https:\/\/lastfm.freetls.fastly.net\/i\/u\/34s\/dcf5cf4b9da64e979719a102acd222cc.png"},{"size":"medium","#text":"https:\/\/lastfm.freetls.fastly.net\/i\/u\/64s\/dcf5cf4b9da64e979719a102acd222cc.png"},{"size":"large","#text":"https:\/\/lastfm.freetls.fastly.net\/i\/u\/174s\/dcf5cf4b9da64e979719a102acd222cc.png"},{"size":"extralarge","#text":"https:\/\/lastfm.freetls.fastly.net\/i\/u\/300x300\/dcf5cf4b9da64e979719a102acd222cc.png"},{"size":"mega","#text":"https:\/\/lastfm.freetls.fastly.net\/i\/u\/300x300\/dcf5cf4b9da64e979719a102acd222cc.png"},{"size":"","#text":"https:\/\/lastfm.freetls.fastly.net\/i\/u\/300x300\/dcf5cf4b9da64e979719a102acd222cc.png"}],"tracks":{"track":[{"streamable":{"fulltrack":"0","#text":"0"},"duration":219,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Prayer","name":"Prayer","@attr":{"rank":1},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":206,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Liberate+-+Amended+Version","name":"Liberate - Amended Version","@attr":{"rank":2},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":269,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Awaken","name":"Awaken","@attr":{"rank":3},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":267,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Believe","name":"Believe","@attr":{"rank":4},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":251,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Remember","name":"Remember","@attr":{"rank":5},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":194,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Intoxication","name":"Intoxication","@attr":{"rank":6},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":237,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Rise","name":"Rise","@attr":{"rank":7},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":226,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Mistress","name":"Mistress","@attr":{"rank":8},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":261,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Breathe","name":"Breathe","@attr":{"rank":9},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":233,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Bound","name":"Bound","@attr":{"rank":10},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":232,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Devour","name":"Devour","@attr":{"rank":11},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}},{"streamable":{"fulltrack":"0","#text":"0"},"duration":388,"url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe\/Darkness","name":"Darkness","@attr":{"rank":12},"artist":{"url":"https:\/\/www.last.fm\/music\/Disturbed","name":"Disturbed","mbid":""}}]},"listeners":"778057","playcount":"13663900","url":"https:\/\/www.last.fm\/music\/Disturbed\/Believe","wiki":{"published":"10 Oct 2008, 04:45","summary":"Believe is the second album by the American rock band, Disturbed. It was released September 17, 2002. It debuted at #1 on the Billboard 200 chart, making it Disturbed's first #1 debut and sold 284,000 copies in its first week. There was also a limited edition release issued with a supplementary DVD and deluxe packaging. <a href=\"https:\/\/www.last.fm\/music\/Disturbed\/Believe\">Read more on Last.fm<\/a>.","content":"Believe is the second album by the American rock band, Disturbed. It was released September 17, 2002. It debuted at #1 on the Billboard 200 chart, making it Disturbed's first #1 debut and sold 284,000 copies in its first week. There was also a limited edition release issued with a supplementary DVD and deluxe packaging. <a href=\"https:\/\/www.last.fm\/music\/Disturbed\/Believe\">Read more on Last.fm<\/a>. User-contributed text is available under the Creative Commons By-SA License; additional terms may apply."}}}
      //     ''';

      //Albumdetail albumDetail = Albumdetail.fromJson(response["album"]);
      Albumdetail albumdetail = Albumdetail(
          artist: "Mock1",
          image: [
            Image(),
            Image(),
            Image(),
            Image(
                size: "extralarge",
                text: "https://wolftracker9eee.blob.core.windows.net/wolfpictures-mock/big-wolf1.png"),
          ],
          listeners: "1234567",
          name: "Mock1",
          playcount: "987654321",
          tracks: Tracks(track: [
            Track(
              duration: 61,
              name: "Mock playlist1",
            ),
            Track(
              duration: 92,
              name: "Mock playlist2",
            ),
            Track(
              duration: 131,
              name: "Mock playlist3",
            ),
            Track(
              duration: 289,
              name: "Mock playlist4",
            ),
            Track(
              duration: 374,
              name: "Mock playlist5",
            ),
          ]),
          url: "",
          wiki: Wiki(
              published: "2021.11.20",
              summary:
                  "Mock1 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."));
      return ApiResult.success(data: albumdetail);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<Album>>> fetchAlbums({int? page, int? limit, String? search}) async {
    try {
//       dynamic response = r'''
// {"results":{"opensearch:Query":{"#text":"","role":"request","searchTerms":"linkin","startPage":"6"},"opensearch:totalResults":"149708","opensearch:startIndex":"25","opensearch:itemsPerPage":"5","albummatches":{"album":[{"name":"Meteora","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Meteora","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/b636ff6f39f8dd435c89fc7bd2e002f8.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/b636ff6f39f8dd435c89fc7bd2e002f8.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/b636ff6f39f8dd435c89fc7bd2e002f8.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/b636ff6f39f8dd435c89fc7bd2e002f8.png","size":"extralarge"}],"streamable":"0","mbid":"f3bfd870-0708-46d0-9953-9f5f573fb600"},{"name":"Hybrid Theory","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Hybrid+Theory","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/b88840f7d608082a85588b2efbbd2d21.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/b88840f7d608082a85588b2efbbd2d21.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/b88840f7d608082a85588b2efbbd2d21.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/b88840f7d608082a85588b2efbbd2d21.png","size":"extralarge"}],"streamable":"0","mbid":"f0cd4041-f859-4b97-b563-3b5f33f98d9d"},{"name":"Minutes to Midnight","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Minutes+to+Midnight","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/185a38ca7368d2c9ad9cb9ea95ae05f4.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/185a38ca7368d2c9ad9cb9ea95ae05f4.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/185a38ca7368d2c9ad9cb9ea95ae05f4.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/185a38ca7368d2c9ad9cb9ea95ae05f4.png","size":"extralarge"}],"streamable":"0","mbid":"d08a98b7-0c33-40d6-b574-ff0ce1600af7"},{"name":"Living Things","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Living+Things","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/5dda2ee492c00966c166665454e10c2d.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/5dda2ee492c00966c166665454e10c2d.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/5dda2ee492c00966c166665454e10c2d.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/5dda2ee492c00966c166665454e10c2d.png","size":"extralarge"}],"streamable":"0","mbid":"bb58b36a-81ce-4b61-a757-fc937b9f95f4"},{"name":"A Thousand Suns","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/A+Thousand+Suns","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/2174f7b60b8b4db6b7e5c0a402aee3ef.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/2174f7b60b8b4db6b7e5c0a402aee3ef.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/2174f7b60b8b4db6b7e5c0a402aee3ef.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/2174f7b60b8b4db6b7e5c0a402aee3ef.png","size":"extralarge"}],"streamable":"0","mbid":"5ae5a7e2-738e-4291-805f-f05cec3e6544"},{"name":"Hybrid Theory (Bonus Edition)","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Hybrid+Theory+(Bonus+Edition)","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/01aa4556b6916185ecd890dad8a42f47.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/01aa4556b6916185ecd890dad8a42f47.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/01aa4556b6916185ecd890dad8a42f47.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/01aa4556b6916185ecd890dad8a42f47.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Reanimation","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Reanimation","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/7135e01b8a5e3179851d660d81a09c48.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/7135e01b8a5e3179851d660d81a09c48.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/7135e01b8a5e3179851d660d81a09c48.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/7135e01b8a5e3179851d660d81a09c48.png","size":"extralarge"}],"streamable":"0","mbid":"649e374f-2874-42f7-88a7-3eea4b8c25b8"},{"name":"One More Light","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/One+More+Light","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/5e03d7c6d69c19819b07cef436e73413.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/5e03d7c6d69c19819b07cef436e73413.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/5e03d7c6d69c19819b07cef436e73413.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/5e03d7c6d69c19819b07cef436e73413.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Meteora (Bonus Edition)","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Meteora+(Bonus+Edition)","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/2a3ab7d7e3155d3779e4997f5f23d0ef.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/2a3ab7d7e3155d3779e4997f5f23d0ef.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/2a3ab7d7e3155d3779e4997f5f23d0ef.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/2a3ab7d7e3155d3779e4997f5f23d0ef.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"The Hunting Party","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/The+Hunting+Party","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/8b39370c7443dd7c2711f8ea1f6fa0dd.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/8b39370c7443dd7c2711f8ea1f6fa0dd.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/8b39370c7443dd7c2711f8ea1f6fa0dd.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/8b39370c7443dd7c2711f8ea1f6fa0dd.png","size":"extralarge"}],"streamable":"0","mbid":"cf1c9b8d-544d-4741-99b6-d3e06f001417"},{"name":"Hybrid Theory (Bonus Track Version)","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Hybrid+Theory+(Bonus+Track+Version)","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/53a7bd85bc99272900f620792bf43452.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/53a7bd85bc99272900f620792bf43452.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/53a7bd85bc99272900f620792bf43452.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/53a7bd85bc99272900f620792bf43452.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Linkin Park - A Thousand
// Suns","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Linkin+Park+-+A+Thousand+Suns","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/9e9a3f1a73a0407fbba040674ab0b6b3.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/9e9a3f1a73a0407fbba040674ab0b6b3.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/9e9a3f1a73a0407fbba040674ab0b6b3.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/9e9a3f1a73a0407fbba040674ab0b6b3.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Linkin Park","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Linkin+Park","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/a4e76e2fb45f4ec7874803b566dc4ad3.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/a4e76e2fb45f4ec7874803b566dc4ad3.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/a4e76e2fb45f4ec7874803b566dc4ad3.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/a4e76e2fb45f4ec7874803b566dc4ad3.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Live in Texas","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Live+in+Texas","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/5ba3942d36864136b7f5331488c5b4ee.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/5ba3942d36864136b7f5331488c5b4ee.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/5ba3942d36864136b7f5331488c5b4ee.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/5ba3942d36864136b7f5331488c5b4ee.png","size":"extralarge"}],"streamable":"0","mbid":"0edb5cf7-aaff-4376-8a6b-373a0f08ce39"},{"name":"Meteora (Bonus Track Version)","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Meteora+(Bonus+Track+Version)","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/8ae66f069da640a6966cccfa6718e846.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/8ae66f069da640a6966cccfa6718e846.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/8ae66f069da640a6966cccfa6718e846.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/8ae66f069da640a6966cccfa6718e846.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"(null)","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/(null)","image":[{"#text":"","size":"small"},{"#text":"","size":"medium"},{"#text":"","size":"large"},{"#text":"","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Hybrid Theory (20th
// Anniversary Edition)","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Hybrid+Theory+(20th+Anniversary+Edition)","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/9c9a382df83d1e7498714bb30fea72a1.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/9c9a382df83d1e7498714bb30fea72a1.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/9c9a382df83d1e7498714bb30fea72a1.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/9c9a382df83d1e7498714bb30fea72a1.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Minutes To Midnight (Explicit Version)","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Minutes+To+Midnight+(Explicit+Version)","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/19c9c39a11bfb294e6743664886e1dd1.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/19c9c39a11bfb294e6743664886e1dd1.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/19c9c39a11bfb294e6743664886e1dd1.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/19c9c39a11bfb294e6743664886e1dd1.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Recharged","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Recharged","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/35306f5b8fcf9b961903fa6b3ec6163c.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/35306f5b8fcf9b961903fa6b3ec6163c.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/35306f5b8fcf9b961903fa6b3ec6163c.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/35306f5b8fcf9b961903fa6b3ec6163c.png","size":"extralarge"}],"streamable":"0","mbid":"9f332dc1-bc91-422d-9f83-a95d0a818d61"},{"name":"Collision Course","artist":"Jay-Z and Linkin Park","url":"https://www.last.fm/music/Jay-Z+and+Linkin+Park/Collision+Course","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/c69908b16e87334f32a4b0beb364d5cc.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/c69908b16e87334f32a4b0beb364d5cc.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/c69908b16e87334f32a4b0beb364d5cc.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/c69908b16e87334f32a4b0beb364d5cc.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"One More Light Live","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/One+More+Light+Live","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/0be0cf0b371843de915ff29773fc544e.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/0be0cf0b371843de915ff29773fc544e.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/0be0cf0b371843de915ff29773fc544e.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/0be0cf0b371843de915ff29773fc544e.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Road To Revolution: Live at Milton Keynes","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Road+To+Revolution:+Live+at+Milton+Keynes","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/722c6525d20740178557dda5bf59d4a9.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/722c6525d20740178557dda5bf59d4a9.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/722c6525d20740178557dda5bf59d4a9.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/722c6525d20740178557dda5bf59d4a9.png","size":"extralarge"}],"streamable":"0","mbid":"9c7b6839-ce71-3741-a107-2f5dc678f4b4"},{"name":"Greatest Hits","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Greatest+Hits","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/7ff4599dc712769dd262fcff394a61cc.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/7ff4599dc712769dd262fcff394a61cc.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/7ff4599dc712769dd262fcff394a61cc.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/7ff4599dc712769dd262fcff394a61cc.png","size":"extralarge"}],"streamable":"0","mbid":"e5c6b50b-2fd7-4cb1-8440-e92c40f81bbb"},{"name":"Hybrid Theory EP","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Hybrid+Theory+EP","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/31b962284bdc7078a61727ef9e702660.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/31b962284bdc7078a61727ef9e702660.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/31b962284bdc7078a61727ef9e702660.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/31b962284bdc7078a61727ef9e702660.png","size":"extralarge"}],"streamable":"0","mbid":"fc40043d-0584-4402-ac6a-91b02a1d20c0"},{"name":"A Thousand Suns (Deluxe Version)","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/A+Thousand+Suns+(Deluxe+Version)","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/ff913f427b6c4544a970f0dd6edf82ad.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/ff913f427b6c4544a970f0dd6edf82ad.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/ff913f427b6c4544a970f0dd6edf82ad.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/ff913f427b6c4544a970f0dd6edf82ad.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"New Divide","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/New+Divide","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/149e60f4493e45468874b6c31950eb53.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/149e60f4493e45468874b6c31950eb53.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/149e60f4493e45468874b6c31950eb53.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/149e60f4493e45468874b6c31950eb53.png","size":"extralarge"}],"streamable":"0","mbid":"d1683e78-37ec-478c-bc22-8c8c09a94244"},{"name":"Linkin Park Underground 12","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Linkin+Park+Underground+12","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/06ea9c1c1e494b008af2490127ba9e50.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/06ea9c1c1e494b008af2490127ba9e50.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/06ea9c1c1e494b008af2490127ba9e50.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/06ea9c1c1e494b008af2490127ba9e50.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Best of Linkin Park","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Best+of+Linkin+Park","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/f5a5aaa86430274158e6f30943e71c6d.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/f5a5aaa86430274158e6f30943e71c6d.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/f5a5aaa86430274158e6f30943e71c6d.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/f5a5aaa86430274158e6f30943e71c6d.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"[Reanimation]","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/%5BReanimation%5D","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/126455d42d4272882e8d3fa563084db4.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/126455d42d4272882e8d3fa563084db4.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/126455d42d4272882e8d3fa563084db4.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/126455d42d4272882e8d3fa563084db4.png","size":"extralarge"}],"streamable":"0","mbid":""},{"name":"Burn It Down","artist":"Linkin Park","url":"https://www.last.fm/music/Linkin+Park/Burn+It+Down","image":[{"#text":"https://lastfm.freetls.fastly.net/i/u/34s/f557c5bf7dda1bde6db3153cda45d9a1.png","size":"small"},{"#text":"https://lastfm.freetls.fastly.net/i/u/64s/f557c5bf7dda1bde6db3153cda45d9a1.png","size":"medium"},{"#text":"https://lastfm.freetls.fastly.net/i/u/174s/f557c5bf7dda1bde6db3153cda45d9a1.png","size":"large"},{"#text":"https://lastfm.freetls.fastly.net/i/u/300x300/f557c5bf7dda1bde6db3153cda45d9a1.png","size":"extralarge"}],"streamable":"0","mbid":"8aa470b7-032e-4859-bdfc-8d21a9365952"}]},"@attr":{"for":"linkin"}}}
// ''';
      // List<Album> albumList = Albummatches.fromJson(response["results"]["albummatches"]).album;
      List<Album> albumList = [];
      albumList
        ..add(Album(
            artist: "Mock1",
            image: [
              Image(),
              Image(),
              Image(),
              Image(
                  size: "extralarge",
                  text: "https://wolftracker9eee.blob.core.windows.net/wolfpictures-mock/big-wolf1.png"),
            ],
            mbid: "mock1",
            name: "Mock1 album",
            streamable: "m1",
            url: ""))
        ..add(Album(
            artist: "Mock2",
            image: [
              Image(),
              Image(),
              Image(),
              Image(
                  size: "extralarge",
                  text: "https://wolftracker9eee.blob.core.windows.net/wolfpictures-mock/big-wolf2.png"),
            ],
            mbid: "mock2",
            name: "Mock2 album",
            streamable: "m2",
            url: ""))
        ..add(Album(
            artist: "Mock3",
            image: [
              Image(),
              Image(),
              Image(),
              Image(
                  size: "extralarge",
                  text: "https://wolftracker9eee.blob.core.windows.net/wolfpictures-mock/big-wolf3.png"),
            ],
            mbid: "mock3",
            name: "Mock3 album",
            streamable: "m3",
            url: ""))
        ..add(Album(
            artist: "Mock4",
            image: [
              Image(),
              Image(),
              Image(),
              Image(
                  size: "extralarge",
                  text: "https://wolftracker9eee.blob.core.windows.net/wolfpictures-mock/big-wolf4.png"),
            ],
            mbid: "mock4",
            name: "Mock4 album",
            streamable: "m4",
            url: ""));
      return ApiResult.success(data: albumList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
