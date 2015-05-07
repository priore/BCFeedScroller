Pod::Spec.new do |s|
  s.name         = "BCFeedScroller"
  s.version      = "1.0.1"
  s.summary      = "Two classes for showing animated feed."
  s.homepage     = "https://github.com/priore/BCFeedScroller"
  s.license      = 'MIT'
  s.author       = { "Danilo Priore" => "support@prioregroup.com" }
  s.platform     = :ios
  s.ios.deployment_target = '5.1.1'
  s.source       = {
    :git => "https://github.com/priore/BCFeedScroller.git",
    :tag => "1.0.1"
  }
  s.requires_arc = false
  s.subspec 'BCFeedScroller' do |ss|
        ss.source_files = 'FeedScroller/Classes/BCFeedItemView.{h,m}',
                          'FeedScroller/Classes/BCFeedItemViewController.{h,m}'
		ss.dependency 'MWFeedParser', '~> 1.0.1'
  end
end
