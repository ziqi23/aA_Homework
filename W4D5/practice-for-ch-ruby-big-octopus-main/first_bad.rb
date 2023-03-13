def first_bad_version(n)
    start_ver = 1
    end_ver = n
    while start_ver < end_ver
        mid_point = (end_ver + start_ver) / 2 
        if is_bad_version(mid_point)
            end_ver = mid_point
        else
            start_ver = mid_point + 1
        end
    end
    return start_ver
end

    # Call the version at n/2 first, if not a bad version, go up from there (3n/4, 7n/8, 15n/16), if a bad version, cut to when it's not a bad version
    # if is_bad_version(1) && !is_bad_version(2)
    #     return 1
    # elsif is_bad_version(n) && !is_bad_version(n - 1)
    #     return n
    # end
    # last_checked = n / 2
    #     next_check = 3 * n / 4
    #     if is_bad_version(last_checked)
    #         return first_bad_version(last_checked)
    #     else
    #         until is_bad_version(next_check)
    #             last_checked = next_check
    #             next_check = n / 2 + next_check / 2
    #         end
    #         until (last_checked == next_check - 1)
    #             if is_bad_version(next_check - (next_check - last_checked) / 2)
    #                 next_check = next_check - (next_check - last_checked) / 2
    #             else
    #                 last_checked = next_check - (next_check - last_checked) / 2
    #             end
    #         end
    #     end
    #     last_checked + 1
    # end

def is_bad_version(n)
    return true if n >= 124985123123562312325609824985123123562312325609824985123149851231235623123256098249851231235623123256098249851231235623123256098
    return false
end

p first_bad_version(124985122325252122131556124985122325252122131556123249851223252521221315561232498512232525212213155232498512232525212213155612324985122325252122131556123)